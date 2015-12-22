//
//  BattleFiledViewController.m
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BattleFiledViewController.h"
#import "HeroViewController.h"
#import "WQQTools.h"
#import "HeroModel.h"

#define HERO_ARRAY @[@"力量型",@"智力型",@"敏捷型"]
@implementation BattleFiledViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    //创建我方战队
    [self createMySqquadron];
    //创建敌方战队
    [self createEnemySqquadron];
    
    [self refreshUI];
    
    while (1) {
        [self scanfData];
    }

}

//创建我方战队
- (void)createMySqquadron{
    self.battle.MySqquadron = [[NSMutableDictionary alloc] init];
    
    for (NSString *hero in HERO_ARRAY) {
        [self.battle.MySqquadron setObject:[NSNull null] forKey:hero];
    }
    
}
//创建敌方战队 每次创建我方战队时，顺便随机一个数去创建敌方战队
- (void)createEnemySqquadron{
    self.battle.enmeySquadron = [[NSMutableDictionary alloc] init];
    for (NSString *hero in HERO_ARRAY) {
        [self.battle.enmeySquadron setObject:[NSNull null] forKey:hero];
    }

}




//刷新UI
- (void)refreshUI{
    
    NSMutableString *msg = [[NSMutableString alloc] init];
    
    [msg appendFormat:@"\n%@\n",self.battle.descri];
    [msg appendFormat:@"😺😺😺😺😺😺😺我方战队😺😺😺😺😺😺\n"];
    int i = 1;
    for (NSString *str in self.battle.MySqquadron) {
        id hero = self.battle.MySqquadron[str];
        
        [msg appendFormat:@"【%d】 【%@】  ",i++,str];
        if (hero == [NSNull null]) {
            [msg appendFormat:@"(请选择)\n"];
        }else{
        
        //英雄
            [msg appendFormat:@"%@\n",[hero name]];
        }
        
    }
    [msg appendFormat:@"💀💀💀💀💀💀💀敌方战队💀💀💀💀💀💀💀\n"];
    for (NSString *str in self.battle.enmeySquadron) {
        id hero = self.battle.enmeySquadron[str];
        
        [msg appendFormat:@"【%d】 【%@】  ",i++,str];
        if (hero == [NSNull null]) {
            [msg appendFormat:@"(请选择)\n"];
        }else{
            
            //英雄
            [msg appendFormat:@"%@\n",[hero name]];
        }
        
    }

    
    
    
    NSLog(@"%@",msg);

}

- (void)scanfData{
    NSLog(@"游戏操作说明:请输入序号，选择你的英雄吧！输入0，返回上一界面\n");
    int inNum;
    scanf("%d",&inNum);
    if (inNum>=1&&inNum<=3) {
        //选择英雄
        [self pushHeroViewControllerWithInNum:inNum];
        
    }else if (inNum==0){
    
    //返回上一界面
    }else{
    
        NSLog(@"输入错误！就你这智商还玩什么游戏！啊！😱😱😿😱😱");
    
    }

}

#pragma mark 跳转到英雄的界面
- (void)pushHeroViewControllerWithInNum:(int)inNum{

    HeroViewController *heroVC = [[HeroViewController alloc] init];

    heroVC.hero_Type = HERO_ARRAY[inNum-1];
    heroVC.path = [WQQTools plistPathWithHeroType:HERO_ARRAY[inNum-1]];
    heroVC.delegate = self;
    [heroVC viewDidLoad];
}

- (void)receiveHeroData:(HeroModel*)hero andEnemyHero:(HeroModel*)enemyHero withHeroType:(NSString*)type{

    [self.battle.MySqquadron removeObjectForKey:type];
    [self.battle.MySqquadron setObject:hero forKey:type];
    
    [self.battle.enmeySquadron removeObjectForKey:type];
    [self.battle.enmeySquadron setObject:enemyHero forKey:type];
    [self refreshUI];
}


@end
