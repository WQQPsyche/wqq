//
//  BattleModel.h
//  DotaGame
//
//  Created by psyche on 15/12/21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaModel.h"
//战役数据模型
@interface BattleModel : DotaModel
@property(nonatomic) NSInteger  mission;//关卡
@property(nonatomic,copy)NSString *name;//名字
@property(nonatomic,copy)NSString *descri;//描述
@property(nonatomic) BOOL isPassed;//是否通关
@property(nonatomic,strong) NSMutableDictionary *MySqquadron;//我方战队
@property(nonatomic,strong)NSMutableDictionary *enmeySquadron;//敌方战队
@end
