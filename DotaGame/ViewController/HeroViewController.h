//
//  HeroViewController.h
//  DotaGame
//
//  Created by psyche on 15/12/16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
/*
 展示可供选择的英雄的界面
 */
#import "RootViewController.h"
#import "HeroModel.h"

//定义协议 将选中的英雄传回BattleViewController界面
@protocol HeroViewControllerDelegate <NSObject>

- (void)receiveHeroData:(HeroModel*)hero andEnemyHero:(HeroModel*)enemyHero withHeroType:(NSString*)type;

@end

@interface HeroViewController : RootViewController
@property(nonatomic,copy)NSString *hero_Type;//英雄类型
@property(nonatomic,copy)NSString *path;//plist文件的路径
@property(nonatomic,weak)id<HeroViewControllerDelegate>delegate;

@end
