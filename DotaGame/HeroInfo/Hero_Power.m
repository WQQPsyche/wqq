//
//  Hero_Power.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Hero_Power.h"

@implementation Hero_Power
- (instancetype)initWithInfoDict:(NSDictionary *)infoDict{
    if (self = [super initWithInfoDict:infoDict]) {
        self.protect = [infoDict objectForKey:@"护盾"];
    }

    return self;
}

- (void)setHeroInfoWithDict:(NSDictionary *)infoDict{
    [super setHeroInfoWithDict:infoDict];
    self.protect = [infoDict objectForKey:@"护盾"];


}
- (NSString *)description{
   return  [NSString stringWithFormat:@"姓名:%@ 生命值:%@ 攻击力:%@ 力量:%@ 敏捷:%@ 智力:%@  护盾:%@ ",self.name,self.MP,self.ATK,self.power,self.quik,self.intelligence,self.protect];

}

- (void)dealloc{
    self.protect = nil;
}
@end
