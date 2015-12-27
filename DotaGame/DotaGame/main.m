//
//  main.m
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DotaRootSceneController.h"
#import "DotaSceneManageController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //注意：请先修改文件的路径 具体见工程中Tool/PathHeader.h文件 谢谢
        
        DotaRootSceneController *rootSecen = [[DotaRootSceneController alloc] init];
        [DotaSceneManageController startWithRootScene:rootSecen];
        
        
    }
    return 0;
}
