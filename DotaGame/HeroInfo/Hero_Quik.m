//
//  Hero_Quik.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Hero_Quik.h"

@implementation Hero_Quik

- (instancetype)initWithInfoDict:(NSDictionary *)infoDict{
    if (self = [super initWithInfoDict:infoDict]) {
        self.dodge = [infoDict objectForKey:@"闪避"];
    }
    return self;
}

- (void)setHeroInfoWithDict:(NSDictionary *)infoDict{

    [super setHeroInfoWithDict:infoDict];
    self.dodge = [infoDict objectForKey:@"闪避"];

}
- (NSString *)description{

    return  [NSString stringWithFormat:@"姓名:%@ 生命值:%@ 攻击力:%@ 力量:%@ 敏捷:%@ 智力:%@  闪避:%@ ",self.name,self.MP,self.ATK,self.power,self.quik,self.intelligence,self.dodge];
}

- (void)dealloc{
    self.dodge = nil;
}
@end
