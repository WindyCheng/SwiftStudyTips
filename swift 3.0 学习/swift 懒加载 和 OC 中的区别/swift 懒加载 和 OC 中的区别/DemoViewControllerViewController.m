//
//  DemoViewControllerViewController.m
//  swift 懒加载 和 OC 中的区别
//
//  Created by Windy on 16/10/6.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "DemoViewControllerViewController.h"

@interface DemoViewControllerViewController ()
    
@property(nonatomic, strong)UILabel *label;

@end

@implementation DemoViewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    
    //释放label
    _label = nil;
    
    //会再次调用懒加载的代码
    NSLog(@"%@", self.label);
    
}
    
- (UILabel *)label{
        if (_label == nil) {
            _label = [[UILabel alloc] init];
            _label.text  = @"My label";
            [_label sizeToFit];
            _label.center = self.view.center;
        }
        return _label;
    }

@end
