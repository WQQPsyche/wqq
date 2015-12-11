//
//  MainViewControllor.h
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

@interface MainViewControllor : RootViewController

@property(nonatomic)NSUInteger currentBattleID;//当前游戏进行到第一关。
//单例
+ (id)defaultMainViewContoller;


@end
