//
//  BattleFiledViewController.m
//  DotaGame
//
//  Created by psyche on 15/12/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BattleFiledViewController.h"
#import "HeroViewController.h"
#import "WQQTools.h"
#import "HeroModel.h"
#import "Hero_PowerModel.h"
#import "Hero_QuikModel.h"
#import "Hero_IntelligenceModel.h"


#define HERO_ARRAY @[@"力量型",@"智力型",@"敏捷型"]
@implementation BattleFiledViewController
{
    BOOL _isReady;//是否可以开始战斗
    BOOL _goBack;

}

- (void)viewDidLoad{
    [super viewDidLoad];
    _isReady = NO;
    _goBack = NO;
    //创建我方战队
    [self createMySqquadron];
    //创建敌方战队,随机产生敌方战队的英雄
    [self createEnemySqquadron];
    
    [self refreshUI];
    
    
    while (!_goBack) {
        
        //检测是否开始战斗
        [self isChooseOverHeros];
        //
        if (_isReady) {
            //开始战斗
            [self warBreakOut];
        }
        if (!_goBack) {
            [self scanfData];
        }
        
    }
    

}
#pragma mark - 我方战队
//创建我方战队
- (void)createMySqquadron{
    self.battle.MySqquadron = [[NSMutableDictionary alloc] init];
    
    for (NSString *hero in HERO_ARRAY) {
        [self.battle.MySqquadron setObject:[NSNull null] forKey:hero];
    }
    
}

- (void)isChooseOverHeros{

    //如果有的英雄还没有选择 就不能开始战斗
    for (NSString *hero in HERO_ARRAY) {
        if (self.battle.MySqquadron[hero]==[NSNull null]) {
            _isReady = NO;
            return;
        }
    }

    _isReady = YES;
}


#pragma mark - 敌方战队
//创建敌方战队 每次创建我方战队时，顺便随机一个数去创建敌方战队
- (void)createEnemySqquadron{
    self.battle.enmeySquadron = [[NSMutableDictionary alloc] init];
    for (NSString *hero in HERO_ARRAY) {
        [self.battle.enmeySquadron setObject:[NSNull null] forKey:hero];
    }
    
    //随机选择敌方战队的英雄
    [self randChooseEmenySqquardronHeros];

}
//随机选择敌方战队的英雄
- (void)randChooseEmenySqquardronHeros{

    HeroViewController *heroVC = [[HeroViewController alloc] init];
    heroVC.delegate = self;
    
    for (int i = 1; i<=3; i++) {
        heroVC.hero_Type = HERO_ARRAY[i-1];
        heroVC.path = [WQQTools plistPathWithHeroType:HERO_ARRAY[i-1]];
        [heroVC chooseEnemySqquardronHeros];

    }

}

#pragma mark - PK 战争爆发
- (void)warBreakOut{
    NSLog(@"双方正在你死我活的混战中！！！");
    //程序休眠 2--3秒
    int time = rand()%2+2;
    sleep(time);

    //战斗力 = 攻击力 - 敌方的护甲
    //攻击力= all ATK + 魔法强度
    //护甲  = 护盾*2 + 闪避*2;
    
    //计算双方的战斗力
    NSInteger myATK = 0,myArmor = 0,enemyATK = 0 ,enemyArmor = 0;
    
    for (NSString *strHeroType in self.battle.MySqquadron) {
        if ([strHeroType isEqualToString:@"力量型"]) {
            Hero_PowerModel * powerHero = [self.battle.MySqquadron objectForKey:strHeroType];
            myATK += [powerHero.ATK integerValue];
            myArmor += [powerHero.protect integerValue]*2;
        }
        if ([strHeroType isEqualToString:@"智力型"]) {
            Hero_IntelligenceModel * intelligenceHero = [self.battle.MySqquadron objectForKey:strHeroType];
            myATK += [intelligenceHero.ATK integerValue];
            myATK += [intelligenceHero.magic integerValue];
        }
        
        if ([strHeroType isEqualToString:@"敏捷型"]) {
            Hero_QuikModel * quickHero = [self.battle.MySqquadron objectForKey:strHeroType];
            myATK += [quickHero.ATK integerValue];
            myArmor += [quickHero.dodge integerValue]*2;
        }
    }
    
    
    for (NSString *strHeroType in self.battle.enmeySquadron) {
        if ([strHeroType isEqualToString:@"力量型"]) {
            Hero_PowerModel * powerHero = [self.battle.enmeySquadron objectForKey:strHeroType];
            enemyATK += [powerHero.ATK integerValue];
            enemyArmor += [powerHero.protect integerValue]*2;
        }
        if ([strHeroType isEqualToString:@"智力型"]) {
            Hero_IntelligenceModel * intelligenceHero = [self.battle.enmeySquadron objectForKey:strHeroType];
            enemyATK += [intelligenceHero.ATK integerValue];
            enemyATK += [intelligenceHero.magic integerValue];
        }
        
        if ([strHeroType isEqualToString:@"敏捷型"]) {
            Hero_QuikModel * quickHero = [self.battle.enmeySquadron objectForKey:strHeroType];
            enemyATK += [quickHero.ATK integerValue];
            enemyArmor += [quickHero.dodge integerValue]*2;
        }
        
        
    }
NSLog(@"%ld-%ld-%ld-%ld\n",myATK,myArmor,enemyATK,enemyArmor);
    if ((myATK-enemyArmor)-(enemyATK-myArmor)>100) {
        NSLog(@"你赢了！");
    }else{
        NSLog(@"你输了！");
    }
    
    sleep(1);
    
    
    _goBack = YES;

}


//刷新UI
- (void)refreshUI{
    
    NSMutableString *msg = [[NSMutableString alloc] init];
    
    [msg appendFormat:@"\n%@\n",self.battle.descri];
    [msg appendFormat:@"💀💀💀💀💀💀💀敌方战队💀💀💀💀💀💀💀\n"];
     int i = 1;
    for (NSString *str in self.battle.enmeySquadron) {
        id hero = self.battle.enmeySquadron[str];
        [msg appendFormat:@"【%d】 【%@】  ",i++,str];
        if (hero == [NSNull null]) {
            [msg appendFormat:@"(请选择)\n"];
        }else{
            
            //英雄
            [msg appendFormat:@"%@\n",[hero name]];
        }
        
    }

    i = 1;
    [msg appendFormat:@"😺😺😺😺😺😺😺我方战队😺😺😺😺😺😺\n"];
   
    for (NSString *str in self.battle.MySqquadron) {
        id hero = self.battle.MySqquadron[str];
        
        [msg appendFormat:@"【%d】 【%@】  ",i++,str];
        if (hero == [NSNull null]) {
            [msg appendFormat:@"(请选择)\n"];
        }else{
        
        //英雄
            [msg appendFormat:@"%@\n",[hero name]];
        }
        
    }
    
    
    
    
    NSLog(@"%@",msg);

}

- (void)scanfData{
    NSLog(@"游戏操作说明:请输入序号，选择你的英雄吧！输入0，返回上一界面\n");
    int inNum;
    scanf("%d",&inNum);
    if (inNum>=1&&inNum<=3) {
        //选择英雄
        [self pushHeroViewControllerWithInNum:inNum];
        
    }else if (inNum==0){
    
    //返回上一界面
    }else{
    
        NSLog(@"输入错误！就你这智商还玩什么游戏！啊！😱😱😿😱😱");
    
    }

}

#pragma mark 跳转到英雄的界面
- (void)pushHeroViewControllerWithInNum:(int)inNum{

    HeroViewController *heroVC = [[HeroViewController alloc] init];

    heroVC.hero_Type = HERO_ARRAY[inNum-1];
    heroVC.path = [WQQTools plistPathWithHeroType:HERO_ARRAY[inNum-1]];
    heroVC.delegate = self;
    [heroVC viewDidLoad];
}
#pragma mark - HeroViewControllerDelegate
- (void)receiveHeroData:(HeroModel*)hero withHeroType:(NSString*)type{

    [self.battle.MySqquadron removeObjectForKey:type];
    [self.battle.MySqquadron setObject:hero forKey:type];
    
    [self refreshUI];
}
//返回敌方战队的英雄
- (void)receiveEnemyHeros:(HeroModel *)Enemy_hero withHeroType:(NSString *)type{

    [self.battle.enmeySquadron removeObjectForKey:type];
    [self.battle.enmeySquadron setObject:Enemy_hero forKey:type];

}

@end
