//
//  HeroViewController.m
//  DotaGame
//
//  Created by psyche on 15/12/16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HeroViewController.h"
#import "WQQTools.h"
#import "Hero.h"

@implementation HeroViewController
{
    NSMutableArray *_heroInfosArray;
    BOOL _isGoBack;//是否返回

}

- (void)viewDidLoad{

    [super viewDidLoad];
    _isGoBack = NO;
    [self createHeroInfoArray];
    [self refreshUI];
    
    while (!_isGoBack) {
        [self scanfData];
    }

}

#pragma mark -数据源

- (void)createHeroInfoArray{

    
    if (_heroInfosArray == nil) {
       _heroInfosArray = [[NSMutableArray alloc] init];
    }else{
    
        [_heroInfosArray removeAllObjects];
    }
    [self parseHeroInfos];

}

- (void)parseHeroInfos{

    NSArray *heroInfos = [[NSArray alloc] initWithContentsOfFile:self.path];
    //根据英雄的类型获取类名
    Class HeroClass = [WQQTools HeroClassWithHeroType:self.hero_Type];
    for (NSDictionary *dict in heroInfos) {
         Hero *hero = [[HeroClass alloc] init];
        [hero setHeroInfoWithDict:dict];
        [_heroInfosArray addObject:hero];
    }

}


#pragma mark - UI界面

- (void) refreshUI{

    NSMutableString *HeroStr = [[NSMutableString alloc] initWithFormat:@"\n👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊👊\n        👊👊👊选择你的%@英雄吧！👊👊👊",self.hero_Type];
    int i = 1;
    for (Hero *hero in _heroInfosArray) {
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
    if (num>=1&&num<10) {
        _isGoBack = YES;
        //选择好了英雄回传英雄的数据
        [self.delegate receiveHeroData:_heroInfosArray[num-1] withHeroType:self.hero_Type];
    
    }else{
        NSLog(@"输入有误！");
    }

}


@end
