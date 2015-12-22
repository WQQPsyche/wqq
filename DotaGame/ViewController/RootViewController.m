//
//  RootViewController.m
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (instancetype)init{
    if (self = [super init]) {

        self.pushedViewControllers = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)viewDidLoad{
    //将自己添加到 数组中
    [self.pushedViewControllers addObject:self];

}

@end
