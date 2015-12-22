//
//  HeroTypeModel.h
//  DotaGame
//
//  Created by psyche on 15/12/21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    Hero_PowerType = -1,
    Hero_QuikModel ,
    Hero_IntelligenceModel
}HeroType;

@interface HeroTypeModel : NSObject

@property(nonatomic) HeroType hero_type;
@property(nonatomic,copy)NSString *heroTypeName;


@end
