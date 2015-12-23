//
//  Hero.h
//  DotaGame
//
//  Created by psyche on 15/12/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

/*
 英雄的父类
 公有属性
 姓名、生命值、攻击力、力量、敏捷、智力
 */
#import <Foundation/Foundation.h>
#import "HeroTypeModel.h"

@interface HeroModel : NSObject
@property(nonatomic,copy)NSString *name; //姓名
@property(nonatomic,copy)NSString *MP; //生命值
@property(nonatomic,copy)NSString *ATK;//攻击力
@property(nonatomic,copy)NSString *power;//力量
@property(nonatomic,copy)NSString *quik;//敏捷
@property(nonatomic,copy)NSString *intelligence;//智力
@property(nonatomic,strong)HeroTypeModel *heroType;

- (instancetype)initWithInfoDict:(NSDictionary*)infoDict;
- (void)setHeroInfoWithDict:(NSDictionary*)infoDict;
@end
