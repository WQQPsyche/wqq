//
//  MainViewControllor.m
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MainViewControllor.h"
#import "BattleFiledViewController.h"

@implementation MainViewControllor
{
    NSArray *_map;//存储关卡的信息
    //增加经验值，开启下一章地图
}
+(id)defaultMainViewContoller{
    static MainViewControllor *mainVC = nil;
    if (mainVC == nil) {
        mainVC = [[MainViewControllor alloc] init];
        mainVC.currentBattleID = 1;//后期修改
    }

    return mainVC;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    //创建关卡列表的数组
    [self createDictData];

    //创建UI界面
    [self refreshUI];

    while (1) {
        [self scanData];
    }

}

//初始化字典的内容
- (void)createDictData{
    
    _map = [[NSArray alloc] initWithContentsOfFile:BATTLE_PATH];
    
}

- (void)refreshUI{
    NSMutableString *msg = [[NSMutableString alloc] initWithString:@"   刀塔传奇\n"];
    for (int i = 0; i<_map.count; i++) {
        NSDictionary *dict = _map[i];
        [msg appendFormat:@"【第%d关】 %@  ",i+1,dict[@"name"]];
        if ([dict[@"isPass"] boolValue]==YES) {
            [msg appendFormat:@"【通关】\n"];
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
    
    if (inData>self.currentBattleID) {
        NSLog(@"亲，你目前才修炼到%lu关，不要操之过急哦~😁\n",self.currentBattleID);
        
    }else if (inData == 0){
    
        [self refreshUI];
    }else {
    
        [self pushViewControllerWithId:inData];
    }
    
}


#pragma mark 推出到战场界面

- (void)pushViewControllerWithId:(NSUInteger)gameId{
    BattleFiledViewController *battle = [[BattleFiledViewController alloc] init];
    battle.battleId = gameId;
    [battle viewDidLoad];
}



@end
