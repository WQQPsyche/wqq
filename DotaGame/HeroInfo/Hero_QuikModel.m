//
//  Hero_Quik.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Hero_QuikModel.h"

@implementation Hero_QuikModel


- (void)setHeroInfoWithDict:(NSDictionary *)infoDict{

    [super setHeroInfoWithDict:infoDict];
    self.dodge = [infoDict objectForKey:@"闪避"];
    HeroTypeModel * heroTypeModel = [[HeroTypeModel alloc] init];
    heroTypeModel.hero_type = Hero_PowerType;
    //获取本类的类名
    heroTypeModel.heroTypeName = NSStringFromClass([self class]);
    self.heroType = heroTypeModel;

}
- (NSString *)description{

    return  [NSString stringWithFormat:@"姓名:%@ 生命值:%@ 攻击力:%@ 力量:%@ 敏捷:%@ 智力:%@  闪避:%@ ",self.name,self.MP,self.ATK,self.power,self.quik,self.intelligence,self.dodge];
}

- (void)dealloc{
    self.dodge = nil;
}
@end
