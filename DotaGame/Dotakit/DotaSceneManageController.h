//
//  DataSceneManageController.h
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DotaBaseController;
@interface DotaSceneManageController : NSObject

@property (nonatomic, strong) NSMutableArray* mControllers;
//根视图控制器
+ (instancetype)startWithRootScene:(DotaBaseController*)rootScene;
//压入视图控制器
- (void)pushController:(DotaBaseController*)controller;
//弹出视图控制器
- (DotaBaseController*)popController;

@end
