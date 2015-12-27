//
//  DotaRootSceneController.m
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaRootSceneController.h"
#import "BattleModel.h"
#import "PathHeader.h"
#import "DotaPickBattleController.h"

@interface DotaRootSceneController ()

@property(nonatomic,strong)NSMutableArray *map;//地图 存储每一场战役
@property(nonatomic) NSInteger currentMission;//目前通关到第几关

@end

@implementation DotaRootSceneController

- (void)didLoadScene{
    [super didLoadScene];
    //创建关卡列表的数组
    [self createAllBattleData];
    
    //创建UI界面
    [self refreshUI];

    while (1) {
        [self scanData];
    }


}

#pragma mark - data数据源
- (void)createAllBattleData{
    
    //先从归档文件取，如果失败再从plist文件中读取
    NSArray *archiverArr = [NSKeyedUnarchiver unarchiveObjectWithFile:ARCHEVER_PATH];
    if (archiverArr.count != 0) {
        self.map = [[NSMutableArray alloc] initWithArray:archiverArr];
        return;
    }
    
    
    self.map = [[NSMutableArray alloc] init];
    
    NSArray *battleArray = [[NSArray alloc] initWithContentsOfFile:BATTLE_PATH];
    
    for (NSDictionary *battleDict in battleArray) {
        
        BattleModel * model = [[BattleModel alloc] init];
        model.name = battleDict[@"name"];
        model.mission = [battleDict[@"mission"] integerValue];
        model.descri = battleDict[@"description"];
        model.isPassed = [battleDict[@"isPass"] boolValue];
        model.MySqquadron = nil;
        model.enmeySquadron = nil;
        [_map addObject:model];
    }
    
}
#pragma mark - UI
- (void)refreshUI{
    NSMutableString *msg = [[NSMutableString alloc] initWithString:@"   刀塔传奇\n"];
    for (int i = 0; i<_map.count; i++) {
        BattleModel *model = _map[i];
        [msg appendFormat:@"【第%ld关】 %@  ",model.mission,model.name];
        if (model.isPassed==YES) {
            [msg appendFormat:@"【通关】\n"];
            self.currentMission = model.mission;
        }else{
            [msg appendFormat:@"【未通关】\n"];
        }
        
    }
    
    NSLog(@"%@",msg);
    
}

- (void)scanData{
    NSLog(@"游戏操作说明:请输入关卡，开始战斗吧！输入0，刷新关卡列表\n");
    int inData;//输入的数据
    scanf("%d",&inData);
    
    if (inData>self.currentMission+1) {
        NSLog(@"亲，你目前才修炼到%lu关，不要操之过急哦~😁\n",self.currentMission+1);
    }else if (inData == 0){
        
        [self refreshUI];
    }else {
        //跳转到下一个界面,参数 所选的战役
        
        for (BattleModel *model in _map) {
            if (model.mission == inData) {
                [self pushViewControllerWithBattle:model];
            }
        }
        
        
    }
    
}


#pragma mark 推出到战场界面

- (void)pushViewControllerWithBattle:(BattleModel*)battle{
    DotaPickBattleController *battleScene = [[DotaPickBattleController alloc] init];
    battleScene.battle = battle;
    battleScene.pBlock = ^(BOOL isPassed){
        //战役结束之后
        [self endOfWarWithBattle:battle withResult:isPassed];
        
    };
    [battleScene didLoadScene];
    
}

//战斗结束之后 更新数据
- (void)endOfWarWithBattle:(BattleModel*)battle withResult:(BOOL)isPassed{
    
    if (isPassed) {
        for (BattleModel *model in _map) {
            if (model.mission == battle.mission) {
                model.isPassed = YES;
            }
        }
        //将更新之后的数据归档存储到文件中
        [NSKeyedArchiver archiveRootObject:_map toFile:ARCHEVER_PATH];
        
    }
    
    [self refreshUI];
    
}





@end
