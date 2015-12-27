//
//  DotaBaseController+SceneManager.h
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaBaseController.h"
#import "DotaSceneManageController.h"

@interface DotaBaseController (SceneManager)
@property (nonatomic, weak) DotaSceneManageController * weakSceneManager;

@end
