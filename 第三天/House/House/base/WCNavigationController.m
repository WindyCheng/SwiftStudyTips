//
//  WCNavigationController.m
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCNavigationController.h"

@interface WCNavigationController ()

@end

@implementation WCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


/**
 *  重写这个方法,能拦截所有的push操作
 *
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0)
    {
         viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *left = [self  barButtonItemWithImage:[UIImage imageNamed:@"back"] highImage:[UIImage imageNamed:@"back"] target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
        //解决按钮不靠左 靠右的问题.
        UIBarButtonItem *nagetiveSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        nagetiveSpacer.width = -30;//这个值可以根据自己需要自己调整
        
        // 设置导航条的按钮
        viewController.navigationItem.leftBarButtonItems = @[nagetiveSpacer, left];
    }
    
   [super pushViewController:viewController animated:animated];
}

- (void)popToPre
{
    [self popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 80,40);
    btn.backgroundColor = [UIColor clearColor];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    
    //button图片的偏移量，距上左下右分别(10, 10, 10, 60)像素点
    btn.imageEdgeInsets = UIEdgeInsetsMake(0,0, 0, 10);
    //button标题的偏移量，这个偏移量是相对于图片的
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn setTitleColor:[UIColor colorWithRed:16./255.0 green:134./255.0 blue:255./255.0 alpha:1.0] forState:UIControlStateNormal];
//    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
