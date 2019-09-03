//
//  WCSelectedCityViewController.h
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelectedCityBlock) (NSString *city);
@interface WCSelectedCityViewController : UITableViewController

@property(nonatomic, copy) SelectedCityBlock block;

@property (copy, nonatomic) NSString *currentCity;

@end
