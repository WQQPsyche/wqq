//
//  Hero.m
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "Hero.h"

@implementation Hero
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
}
@end
