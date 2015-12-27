//
//  DataSceneManageController.m
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaSceneManageController.h"
#import "DotaBaseController+SceneManager.h"

@implementation DotaSceneManageController

+ (instancetype)startWithRootScene:(DotaBaseController *)rootScene
{
    //创建视图管理器
    DotaSceneManageController* sceneManager = [[DotaSceneManageController alloc] init];

    //压入跟视图控制器
    [sceneManager pushController:rootScene];
    [rootScene didLoadScene];
    return sceneManager;
}

- (void)pushController:(DotaBaseController *)controller
{
    //入栈
    [self.mControllers addObject:controller];
    controller.weakSceneManager = self;
    [controller didLoadScene];
}

- (DotaBaseController *)popController
{
    //出栈
    DotaBaseController* popController = [self.mControllers lastObject];
    [self.mControllers removeLastObject];
    return popController;
}

@end
