//
//  DotaPickHeroController.h
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

/*
 展示可供选择的英雄的界面
 */
#import "DotaBaseController.h"
#import "HeroModel.h"

//定义协议 将选中的英雄传回BattleViewController界面
@protocol DotaPickHeroControllerDelegate <NSObject>

- (void)receiveHeroData:(HeroModel*)hero  withHeroType:(NSString*)type;
- (void)receiveEnemyHeros:(HeroModel *)Enemy_hero withHeroType:(NSString *)type;

@end


@interface DotaPickHeroController : DotaBaseController

@property(nonatomic,copy)NSString *hero_Type;//英雄类型
@property(nonatomic,copy)NSString *path;//plist文件的路径
@property(nonatomic,weak)id<DotaPickHeroControllerDelegate>delegate;

//选择敌方战队
- (void)chooseEnemySqquardronHeros;

@end
