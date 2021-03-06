//
//  MainViewControllor.m
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MainViewControllor.h"
#import "BattleFiledViewController.h"
#import "BattleModel.h"



@implementation MainViewControllor
{
    NSMutableArray *_map;//存储关卡的信息
    //增加经验值，开启下一章地图
}
+(id)defaultMainViewContoller{
    static MainViewControllor *mainVC = nil;
    if (mainVC == nil) {
        mainVC = [[MainViewControllor alloc] init];
//        mainVC.currentBattleID = 1;//后期修改
    }

    return mainVC;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    //创建关卡列表的数组
    [self createAllBattleData];

    //创建UI界面
    [self refreshUI];

    while (1) {
        [self scanData];
    }

}

//初始化字典的内容
- (void)createAllBattleData{
    
    //先从归档文件取，如果失败再从plist文件中读取
    NSArray *archiverArr = [NSKeyedUnarchiver unarchiveObjectWithFile:ARCHEVER_PATH];
    if (archiverArr.count != 0) {
        _map = [[NSMutableArray alloc] initWithArray:archiverArr];
        return;
    }
    
    
    _map = [[NSMutableArray alloc] init];
    
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

- (void)refreshUI{
    NSMutableString *msg = [[NSMutableString alloc] initWithString:@"   刀塔传奇\n"];
    for (int i = 0; i<_map.count; i++) {
        BattleModel *model = _map[i];
        [msg appendFormat:@"【第%ld关】 %@  ",model.mission,model.name];
        if (model.isPassed==YES) {
            [msg appendFormat:@"【通关】\n"];
            self.currentBattleID = model.mission;
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
    
    if (inData>self.currentBattleID+1) {
        NSLog(@"亲，你目前才修炼到%lu关，不要操之过急哦~😁\n",self.currentBattleID+1);
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
    BattleFiledViewController *battleVC = [[BattleFiledViewController alloc] init];
    battleVC.battle = battle;
    battleVC.pBlock = ^(BOOL isPassed){
    
        //战役结束之后
        [self endOfWarWithBattle:battle withResult:isPassed];
    
    };
    [battleVC viewDidLoad];
    
   }

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
