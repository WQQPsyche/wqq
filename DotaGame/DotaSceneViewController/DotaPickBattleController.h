//
//  DotaPickBattleController.h
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

/*
 战斗场景
 从主场景传过来战役到战斗场景开始选择英雄
 */
#import "DotaBaseController.h"
#import "BattleModel.h"
#import "DotaPickHeroController.h"

@interface DotaPickBattleController : DotaBaseController<DotaPickHeroControllerDelegate>

@property(nonatomic,strong)BattleModel *battle;
@property(nonatomic,copy)void (^pBlock)(BOOL);//用于将战斗结果返回

@end
