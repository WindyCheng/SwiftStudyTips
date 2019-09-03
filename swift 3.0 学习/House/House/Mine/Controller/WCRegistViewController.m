//
//  WCRegistViewController.m
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCRegistViewController.h"
#import "WCLoginViewController.h"
#import "UIView+Toast.h"

@interface WCRegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *nickNameTF;


@property (weak, nonatomic) IBOutlet UITextField *inviteCodeTF;

@property (weak, nonatomic) IBOutlet UIButton *timeBtn;

@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;

@property (weak, nonatomic) IBOutlet UIButton *summitBtn;






@end

@implementation WCRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self timeClick:nil];
    [_agreeBtn setBackgroundImage:[UIImage imageNamed:@"checkboxYes"] forState:UIControlStateSelected];
    [_agreeBtn setBackgroundImage:[UIImage imageNamed:@"checkboxNo"] forState:UIControlStateNormal];
    _agreeBtn.selected = YES;
    

}

- (IBAction)timeClick:(UIButton *)sender {
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.timeBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
                [self.timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.timeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.timeBtn setTitle:[NSString stringWithFormat:@"%dS后重新发送", seconds] forState:UIControlStateNormal];
                [self.timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.timeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}


- (IBAction)agreeClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        _summitBtn.enabled = YES;
    }else{
        _summitBtn.enabled = NO;
    }
}


- (IBAction)summitClick:(UIButton *)sender
{
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[WCLoginViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}




//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

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
