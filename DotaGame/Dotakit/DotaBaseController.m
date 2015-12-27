//
//  DotaBaseController.m
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaBaseController.h"
#import "DotaBaseController+SceneManager.h"

@implementation DotaBaseController
- (void)didLoadScene
{
    NSLog(@"[%@ didLoadScene]", NSStringFromClass([self class]));
}

- (DotaSceneManageController *)sceneManager
{
    return self.weakSceneManager;
}

@end
