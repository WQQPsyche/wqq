//
//  WQQTools.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "WQQTools.h"
#import "PathHeader.h"

@implementation WQQTools
+ (NSString *)plistPathWithHeroType:(NSString *)type{
    NSDictionary *pathDict = @{
                               @"力量型":HERO_POWER,
                               @"智力型":HERO_INTELLIGENCE,
                               @"敏捷型":HERO_QUICK
                               };
    
    return pathDict[type];

}

+ (Class)HeroClassWithHeroType:(NSString *)type{

    NSDictionary *heroClassDict = @{
                                    
                                    @"力量型":@"Hero_PowerModel",
                                    @"智力型":@"Hero_IntelligenceModel",
                                    @"敏捷型":@"Hero_QuikModel"
                                    
                                    };
    
    
    return NSClassFromString(heroClassDict[type]) ;


}

@end
