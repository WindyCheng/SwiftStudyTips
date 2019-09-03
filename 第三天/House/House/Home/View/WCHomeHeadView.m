//
//  WCHomeHeadView.m
//  House
//
//  Created by zcds2 on 2016/11/24.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCHomeHeadView.h"

@implementation WCHomeHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (WCHomeHeadView *)initWithNib
{
    WCHomeHeadView  *view = [[[NSBundle mainBundle] loadNibNamed:@"WCHomeHeadView" owner:self options:nil]lastObject];
    return view;
}

@end
