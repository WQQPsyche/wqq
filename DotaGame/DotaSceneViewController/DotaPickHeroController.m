//
//  DotaPickHeroController.m
//  DotaGame
//
//  Created by psyche on 15/12/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DotaPickHeroController.h"
#import "WQQTools.h"
#import "HeroTypeModel.h"

@interface DotaPickHeroController ()

@property(nonatomic,strong)NSMutableArray *heroInfosArray;
@property(nonatomic) BOOL isGoBack;//是否退出该场景

@end

@implementation DotaPickHeroController

- (void)didLoadScene{
    
    [super didLoadScene];
    _isGoBack = NO;
    [self createHeroInfoArray];
    [self refreshUI];
    
    while (!_isGoBack) {
        [self scanfData];
    }
    
}

#pragma mark -数据源

- (void)createHeroInfoArray{
    
    
    if (self.heroInfosArray == nil) {
        self.heroInfosArray = [[NSMutableArray alloc] init];
    }else{
        
        [self.heroInfosArray removeAllObjects];
    }
    [self parseHeroInfos];
    
}

- (void)parseHeroInfos{
    
    NSArray *heroInfos = [[NSArray alloc] initWithContentsOfFile:self.path];
    //根据英雄的类型获取类名
    Class HeroClass = [WQQTools HeroClassWithHeroType:self.hero_Type];
    for (NSDictionary *dict in heroInfos) {
        HeroModel *hero = [[HeroClass alloc] init];
        [hero setHeroInfoWithDict:dict];
        //设置英雄的类型
        hero.heroType = self.hero_Type;
        [_heroInfosArray addObject:hero];
    }
    
}


#pragma mark - UI界面

- (void) refreshUI{
    
    NSMutableString *HeroStr = [[NSMutableString alloc] initWithFormat:@"\n👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊\n        👊👊👊选择你的%@英雄吧！👊👊👊",self.hero_Type];
    int i = 1;
    for (HeroModel *hero in _heroInfosArray) {
        [HeroStr appendFormat:@"\n【%d】%@\n",i++,hero];
        
    }
    NSLog(@"%@",HeroStr);
    
}

#pragma mark - 输入
- (void)scanfData{
    
    NSString *str = [NSString stringWithFormat:@"游戏操作说明：请输入序号，选择你的%@英雄吧！",self.hero_Type];
    NSLog(@"%@",str);
    int num;
    scanf("%d",&num);
    if (num>=1&&num<=10) {
        _isGoBack = YES;
        //弹出该场景
        [self.sceneManager popController];
        //选择好了英雄回传英雄的数据
        [self.delegate receiveHeroData:_heroInfosArray[num-1] withHeroType:self.hero_Type];

    }else{
        NSLog(@"输入有误！");
    }
    
}
//敌方战队选择英雄
- (void)chooseEnemySqquardronHeros{
    [self createHeroInfoArray];
    int enemy_Hero_Num = arc4random()%10;
    [self.delegate receiveEnemyHeros:_heroInfosArray[enemy_Hero_Num] withHeroType:self.hero_Type];
    
}


@end
