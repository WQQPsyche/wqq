//
//  BattleModel.m
//  DotaGame
//
//  Created by psyche on 15/12/21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BattleModel.h"

@implementation BattleModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.mission forKey:@"mission"];
    [aCoder encodeObject:self.descri forKey:@"descri"];
    [aCoder encodeObject:self.MySqquadron forKey:@"mySqquadron"];
    [aCoder encodeObject:self.enmeySquadron forKey:@"enemy"];
    [aCoder encodeBool:self.isPassed forKey:@"isPassed"];
    


}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
       
        self.mission = [aDecoder decodeIntegerForKey:@"mission"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.descri = [aDecoder decodeObjectForKey:@"descri"];
        self.isPassed = [aDecoder decodeBoolForKey:@"isPassed"];
        self.MySqquadron = [aDecoder decodeObjectForKey:@"mySqquadron"];
        self.enmeySquadron = [aDecoder decodeObjectForKey:@"enemy"];
    }
    
    return self;
}
@end
