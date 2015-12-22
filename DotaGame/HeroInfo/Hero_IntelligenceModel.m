//
//  Hero_Intelligence.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Hero_IntelligenceModel.h"

@implementation Hero_IntelligenceModel
- (instancetype)initWithInfoDict:(NSDictionary *)infoDict{
    if (self = [super initWithInfoDict:infoDict]) {
       self.magic = [infoDict objectForKey:@"魔法强度"];
    }
    
    return self;
}

- (void)setHeroInfoWithDict:(NSDictionary *)infoDict{

    [super setHeroInfoWithDict:infoDict];
    self.magic = [infoDict objectForKey:@"魔法强度"];
}

- (NSString *)description{

    return  [NSString stringWithFormat:@"姓名:%@ 生命值:%@ 攻击力:%@ 力量:%@ 敏捷:%@ 智力:%@  魔法强度:%@ ",self.name,self.MP,self.ATK,self.power,self.quik,self.intelligence,self.magic];
}


-(void)dealloc{
    self.magic = nil;
}
@end
