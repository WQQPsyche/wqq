//
//  BattleFiledViewController.m
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BattleFiledViewController.h"
#define HERO_ARRAY @[@"力量型",@"智力型",@"敏捷型"]
@implementation BattleFiledViewController
{
    NSMutableDictionary *_heroInfoDict;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self createHeroInfoDict];
    [self refreshUI];

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
        }
        
    }
    
    NSLog(@"%@",msg);

}


@end
