//
//  MainViewControllor.m
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MainViewControllor.h"

@implementation MainViewControllor
+(id)defaultMainViewContoller{
    static MainViewControllor *mainVC = nil;
    if (mainVC == nil) {
        mainVC = [[MainViewControllor alloc] init];
    }

    return mainVC;
}

- (void)freshUI{
    NSLog(@"\n    刀塔传奇\n【第一关】未通关\n【第二关】未通关\n【第三关】未通关\n【第四关】未通关\n【第五关】未通关\n请输入对应的关卡号开始战斗吧！刷新界面请输入0");
    

}

@end
