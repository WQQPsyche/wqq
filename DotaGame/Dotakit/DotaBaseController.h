//
//  DotaBaseController.h
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DotaSceneManageController.h"

@interface DotaBaseController : NSObject

@property (nonatomic,strong,readonly)DotaSceneManageController *sceneManager;
- (void)didLoadScene;

@end
