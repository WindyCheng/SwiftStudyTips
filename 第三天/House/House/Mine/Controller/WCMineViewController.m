//
//  WCMineViewController.m
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCMineViewController.h"
#import "WCMineCell.h"

@interface WCMineViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, copy)NSString *userName;
@end

@implementation WCMineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _userName = [[NSUserDefaults standardUserDefaults] valueForKey:@"account"];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   WCMineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
     cell.nameLabel.text = _userName ? _userName : @"";
    return cell;
 }

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.000001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
     [self performSegueWithIdentifier:@"login" sender:self];
}


@end
