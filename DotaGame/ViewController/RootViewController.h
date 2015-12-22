//
//  RootViewController.h
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathHeader.h"

@interface RootViewController : NSObject

@property(nonatomic,strong) NSMutableArray * pushedViewControllers;

- (void)viewDidLoad;
@end
