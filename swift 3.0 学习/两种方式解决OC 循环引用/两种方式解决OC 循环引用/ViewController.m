//
//  ViewController.m
//  两种方式解决OC 循环引用
//
//  Created by Windy on 16/10/4.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(copy, nonatomic)void (^copletionCallBack)();

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    //解除循环引用方法1
   // __weak typeof(self) weakSelf = self;
   // [self loadData:^{
   //     NSLog(@"------%@", weakSelf.view);
 //   }];
    
    
    //解除循环引用方法2(不常用)
    //EXC_BAD_ACCESS 坏内存访问,野指针访问
    //__unsafe_unretained 同样是assign 的引用,(MRC 中没有weak)
    //在MRC 中如果要若引用对象都是使用 assign,不会增加内存计数,但是一旦对象被释放,地址不会改变,继续访问,出现野指针
    //在ARC 中weak,本质上是一个观察者模式,一旦发现对象被释放,会自动将地址设置nil, 更加安全
    //效率: weak的效率会略微差一些!
    __unsafe_unretained typeof(self) weakSelf = self; //MRC 中
    [self loadData:^{
        NSLog(@"------%@", weakSelf.view);
    }];
}

- (void)loadData:(void (^)())completion{
    
    //使用属性记录block
    self.copletionCallBack = completion;
    
    dispatch_async(dispatch_get_global_queue(0, 0),^{
        
        NSLog(@"耗时操作 %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2.0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion();
        });
        
        
    });
    
    
}

- (void)dealloc{
    
    NSLog(@"死了");
}




@end
