//
//  WCHomeEntity.m
//  House
//
//  Created by zcds2 on 2016/11/23.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCHomeEntity.h"

@implementation WCHomeEntity


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)houseWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}




@end
