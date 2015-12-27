//
//  HeroTypeModel.m
//  DotaGame
//
//  Created by psyche on 15/12/21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HeroTypeModel.h"

@implementation HeroTypeModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.heroTypeName forKey:@"heroTypeName"];
    [aCoder encodeInteger:self.hero_type forKey:@"hero_type"];

}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.hero_type = (int)[aDecoder decodeIntegerForKey:@"hero_type"];
        self.heroTypeName = [aDecoder decodeObjectForKey:@"heroTypeName"];
        
    }
    
    return self;


}
@end
