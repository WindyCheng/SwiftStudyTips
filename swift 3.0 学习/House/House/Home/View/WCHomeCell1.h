//
//  WCHomeCell1.h
//  House
//
//  Created by zcds2 on 2016/11/23.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WCHomeCell1Block) (NSInteger itemTag);
@interface WCHomeCell1 : UITableViewCell

@property(strong, nonatomic) NSArray *array;

@property(copy, nonatomic)WCHomeCell1Block block;

@end
