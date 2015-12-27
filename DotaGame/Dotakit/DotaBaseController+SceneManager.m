//
//  DotaBaseController+SceneManager.m
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaBaseController+SceneManager.h"
#import <objc/runtime.h>

@implementation DotaBaseController (SceneManager)


- (void)setWeakSceneManager:(DotaSceneManageController *)weakSceneManager_
{
    objc_setAssociatedObject(self, @"weakSceneManager", weakSceneManager_, OBJC_ASSOCIATION_ASSIGN);
}


- (DotaSceneManageController *)weakSceneManager
{
    return objc_getAssociatedObject(self, @"weakSceneManager");
}

@end
