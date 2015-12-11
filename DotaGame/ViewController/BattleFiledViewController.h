//
//  BattleFiledViewController.h
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RootViewController.h"
//战场
@interface BattleFiledViewController : RootViewController

@property(nonatomic)NSUInteger  battleId;

- (void)refreshUI;
@end
