//
//  Hero.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel
- (instancetype)initWithInfoDict:(NSDictionary *)infoDict{
    if (self = [super init]) {
        self.name = [infoDict objectForKey:@"name"];
        self.MP = [infoDict objectForKey:@"MP"];
        self.ATK = [infoDict objectForKey:@"攻击力"];
        self.intelligence = [infoDict objectForKey:@"智力"];
        self.power = [infoDict objectForKey:@"力量"];
        self.quik = [infoDict objectForKey:@"敏捷"];
    }
    
    return self;

}

- (void)setHeroInfoWithDict:(NSDictionary *)infoDict{

    self.name = [infoDict objectForKey:@"name"];
    self.MP = [infoDict objectForKey:@"MP"];
    self.ATK = [infoDict objectForKey:@"攻击力"];
    self.intelligence = [infoDict objectForKey:@"智力"];
    self.power = [infoDict objectForKey:@"力量"];
    self.quik = [infoDict objectForKey:@"敏捷"];


}
- (void)dealloc{
    self.name = nil;
    self.MP = nil;
    self.ATK = nil;
    self.intelligence = nil;
    self.power = nil;
    self.quik = nil;
    self.heroType = nil;
}

#pragma mark - 归档解档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.MP forKey:@"MP"];
    [aCoder encodeObject:self.ATK forKey:@"ATK"];
    [aCoder encodeObject:self.intelligence forKey:@"intelligence"];
    [aCoder encodeObject:self.power forKey:@"power"];
    [aCoder encodeObject:self.quik forKey:@"quick"];
    [aCoder encodeObject:self.heroType forKey:@"heroType"];
    
    

}
- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.MP = [aDecoder decodeObjectForKey:@"MP"];
        self.ATK = [aDecoder decodeObjectForKey:@"ATK"];
        self.intelligence = [aDecoder decodeObjectForKey:@"intelligence"];
        self.power = [aDecoder decodeObjectForKey:@"power"];
        self.quik = [aDecoder decodeObjectForKey:@"quick"];
        self.heroType = [aDecoder decodeObjectForKey:@"heroType"];
        
    }
    return self;
    

}
@end
