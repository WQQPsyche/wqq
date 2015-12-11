//
//  createInfo.m
//  DotaGame
//
//  Created by psyche on 15/12/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "createInfo.h"
#define PATH @"/Users/psyche/Desktop/battle.plist"
@implementation createInfo
//自己创建虚拟的数据。
- (void)createData{

    NSArray *battleInfo = @[@{@"name":@"异界战场",@"description":@"睁开双眼，身处一个奇怪的地方，远处传来隆隆的战鼓声，有东西向你冲了过来。"},@{@"name":@"异传送阵",@"description":@"白骨之中的传送阵在召唤这些怪物，一个身影在守护。"},@{@"name":@"忠诚的证明",@"description":@"原谅我的鲁莽，指挥官。我会用我的雷电证明我的忠诚。"},@{@"name":@"异界战场",@"description":@"睁开双眼，身处一个奇怪的地方，远处传来隆隆的战鼓声，有东西向你冲了过来。"},@{@"name":@"军营",@"description":@"想让我们的长官......救治......先证明......的身份。余下的你听不见了。"},@{@"name":@"埋骨场",@"description":@"倒下的骷髅王再次站起来，带领更多的怪物向你冲来。"},@{@"name":@"异全军出击",@"description":@"面对死灵法师的镰刀,只需要做一件事:全军出击！"},@{@"name":@"歌声中的回忆",@"description":@"“原来你真的不记得了，指挥官。”小鹿拿出长矛，“希望这样你能够记得一些。”"},@{@"name":@"战场中央",@"description":@"一阵混战之后，你发现自己陷入了战场的中央。"},@{@"name":@"异突围",@"description":@"伴随着一阵笑声，那个影子消失了，他是谁？周围越来越混乱，先赶紧离开才行。"}];
    [battleInfo writeToFile:PATH atomically:YES];


}
@end
