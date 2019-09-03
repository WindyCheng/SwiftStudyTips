//
//  WCHomeEntity.h
//  House
//
//  Created by zcds2 on 2016/11/23.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCHomeEntity : NSObject

@property(nonatomic, copy)NSString *houseName;
@property(nonatomic, copy)NSString *region;
@property(nonatomic, copy)NSString *square;
@property(nonatomic, copy)NSString *price;
@property(nonatomic, strong)NSNumber *onSell;
@property(nonatomic, copy)NSString *img;
@property(nonatomic, copy)NSString *des;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)houseWithDict:(NSDictionary *)dict;

@end
