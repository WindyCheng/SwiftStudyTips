//
//  WCCalulateViewController.m
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCCalulateViewController.h"

@interface WCCalulateViewController ()

@property (weak, nonatomic) IBOutlet UIButton *fundsBtn;
@property (weak, nonatomic) IBOutlet UIButton *combineBtn;

@property (weak, nonatomic) IBOutlet UIButton *tradeBtn;

@property (weak, nonatomic) IBOutlet UIButton *interestBtn;

@property (weak, nonatomic) IBOutlet UIButton *capitalBtn;

@property (weak, nonatomic) IBOutlet UITextField *moneyTF;

@property (weak, nonatomic) IBOutlet UITextField *yearTF;


@property (weak, nonatomic) IBOutlet UILabel *rateLabel;

@end

@implementation WCCalulateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_fundsBtn setImage:[UIImage imageNamed:@"deseleteed"] forState:UIControlStateNormal];
    [_fundsBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    _fundsBtn.selected = YES;
    
    [_tradeBtn setImage:[UIImage imageNamed:@"deseleteed"] forState:UIControlStateNormal];
    [_tradeBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [_combineBtn setImage:[UIImage imageNamed:@"deseleteed"] forState:UIControlStateNormal];
    [_combineBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    
    [_interestBtn setImage:[UIImage imageNamed:@"deseleteed"] forState:UIControlStateNormal];
    [_interestBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    _interestBtn.selected = YES;
    
    [_capitalBtn setImage:[UIImage imageNamed:@"deseleteed"] forState:UIControlStateNormal];
    [_capitalBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
}



- (IBAction)fundsClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _loanType = FundsType;
        _tradeBtn.selected = NO;
        _combineBtn.selected = NO;
    }else{
        
    }
}


- (IBAction)tradeClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _loanType = TradeType;
        _fundsBtn.selected = NO;
        _combineBtn.selected = NO;
    }else{
        
    }
}

- (IBAction)combineClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _loanType = CombineType;
        _fundsBtn.selected = NO;
        _tradeBtn.selected = NO;
    }else{
        
    }
}

- (IBAction)interestClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _repaymentType = InterestType;
        _capitalBtn.selected = NO;

    }else{
    }
}


- (IBAction)capitalClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        _repaymentType = CapitalType;
        _interestBtn.selected = NO;

    }else{
    }
}






- (IBAction)caculateClick:(UIButton *)sender {
//计算
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return section == 1 ? 1 : 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 1 ? 10 : 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 && indexPath.row == 4) {
        [self performSegueWithIdentifier:@"rate" sender:self];
    }
    
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
