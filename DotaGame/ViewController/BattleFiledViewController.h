//
//  BattleFiledViewController.h
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RootViewController.h"
#import "HeroViewController.h"
#import "BattleModel.h"

//战场界面
@interface BattleFiledViewController : RootViewController<HeroViewControllerDelegate>

@property(nonatomic,strong)BattleModel *battle;

- (void)refreshUI;
@end
