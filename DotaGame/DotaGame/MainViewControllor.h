//
//  MainViewControllor.h
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
/*地图--展示每一场战役*/
#import "RootViewController.h"

@interface MainViewControllor : RootViewController

@property(nonatomic)NSUInteger currentBattleID;//当前游戏进行到第一关。

@property(nonatomic,strong) NSMutableArray * pushedViewControllers;

//单例
+ (id)defaultMainViewContoller;


@end
