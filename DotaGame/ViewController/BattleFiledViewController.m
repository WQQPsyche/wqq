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
#import "Hero.h"

#define HERO_ARRAY @[@"力量型",@"智力型",@"敏捷型"]
@implementation BattleFiledViewController
{
    NSMutableDictionary *_heroInfoDict;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self createHeroInfoDict];
    [self refreshUI];
    
    while (1) {
        [self scanfData];
    }

}

//创建该战场的英雄信息
- (void)createHeroInfoDict{
    _heroInfoDict = [[NSMutableDictionary alloc] init];
    
    for (NSString *hero in HERO_ARRAY) {
        [_heroInfoDict setObject:[NSNull null] forKey:hero];
    }
    
}

//刷新UI
- (void)refreshUI{
    
    NSMutableString *msg = [[NSMutableString alloc] init];
    NSArray * battles = [[NSArray alloc] initWithContentsOfFile:BATTLE_PATH];
    NSDictionary *battleInfo = battles[self.battleId];
    
    [msg appendFormat:@"\n%@\n",battleInfo[@"description"]];
    
    int i = 1;
    for (NSString *str in _heroInfoDict) {
        id hero = _heroInfoDict[str];
        
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

- (void)receiveHeroData:(Hero *)hero withHeroType:(NSString *)type{

    [_heroInfoDict removeObjectForKey:type];
    [_heroInfoDict setObject:hero forKey:type];
    [self refreshUI];
}

@end
