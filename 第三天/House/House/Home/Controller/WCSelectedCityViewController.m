//
//  WCSelectedCityViewController.m
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCSelectedCityViewController.h"


static NSString *const  cellId1 = @"Cell1";
static NSString *const  cellId2 = @"Cell2";
@interface WCSelectedCityViewController ()

@property (strong, nonatomic) NSMutableArray *dataArr;

@property (strong, nonatomic) NSMutableArray *indexArr;

@property (strong, nonatomic) NSMutableArray *allArr;


@end

@implementation WCSelectedCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _allArr = [NSMutableArray array];
    _indexArr = [NSMutableArray array];
//    _indexArr  = [@[@[@""], @[@"A"], @[@"B"]] mutableCopy];
    _indexArr  = [@[@"",@"A",@"B"] mutableCopy];
    NSArray *arr1 = @[_currentCity ? _currentCity : @""];
    NSArray *arr2 = @[@"鞍山", @"安阳", @"安康"];
    NSArray *arr3 = @[@"北京", @"北海", @"保定"];
    
    [_allArr addObject:arr1];
    [_allArr addObject:arr2];
    [_allArr addObject:arr3];
    self.tableView.backgroundColor = [UIColor colorWithRed:189./255.0 green:189./255.0 blue:189./255.0 alpha:1.0];
   self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
   self.tableView.sectionIndexColor = [UIColor blackColor];
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId1];
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId2];
    
}

#pragma mark - Table view data source
#pragma --mark--UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  _indexArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _allArr[section];
    return [arr count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];

        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = _currentCity;

        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = _allArr[indexPath.section][indexPath.row];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (section == 0)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        label.text = @"当前定位城市";
        return label;
    }else{
      
     return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *city = _allArr[indexPath.section][indexPath.row];
    
    if (_block) {
        _block(city);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 30.;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _indexArr[section];
}


- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _indexArr;
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
