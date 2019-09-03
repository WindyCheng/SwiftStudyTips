//
//  WCSearchBar.m
//  House
//
//  Created by zcds2 on 2016/11/23.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCSearchBar.h"

@implementation WCSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont systemFontOfSize:13];
        
        //        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 3;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 0.8;
        
        // 设置左边的view
        // initWithImage:默认UIImageView的尺寸跟图片一样
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_search"]];
        
        CGRect frame = imageV.frame;
        frame.size.width += 20;
        imageV.frame = frame;
        imageV.contentMode = UIViewContentModeCenter;
        self.leftView = imageV;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
    return self;
}



@end
