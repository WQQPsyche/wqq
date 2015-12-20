//
//  WQQTools.h
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WQQTools : NSObject
//根据英雄的类型返回 对应的plist文件的路径
+ (NSString*)plistPathWithHeroType:(NSString*)type;

//根据英雄的类型返回产品的类
+ (Class)HeroClassWithHeroType:(NSString*)type;

@end
