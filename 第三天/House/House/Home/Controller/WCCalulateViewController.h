//
//  WCCalulateViewController.h
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LoanType) {
    FundsType = 1,
    TradeType,
    CombineType
};

typedef NS_ENUM(NSInteger, RepaymentType) {
    InterestType = 1,
    CapitalType
};

@interface WCCalulateViewController : UITableViewController

@property(nonatomic, assign)LoanType loanType;
@property(nonatomic, assign)RepaymentType repaymentType;

@end
