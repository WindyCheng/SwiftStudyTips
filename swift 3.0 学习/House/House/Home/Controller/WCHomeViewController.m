//
//  WCHomeViewController.m
//  House
//
//  Created by zcds2 on 2016/11/22.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCHomeViewController.h"
#import "WCSelectedCityViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "SDCycleScrollView.h"
#import "WCHomeCell1.h"
#import "WCHomeCell2.h"
#import "WCHomeCell3.h"
#import "WCHomeHeadView.h"
#import "WCHomeEntity.h"
#import "WCSearchBar.h"

static NSString *const cellId1 = @"Cell1";
static NSString *const cellId2 = @"Cell2";
static NSString *const cellId3 = @"Cell3";
@interface WCHomeViewController ()<UITableViewDelegate, UITableViewDataSource,SDCycleScrollViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate>

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)UIView  *bannerView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, copy) NSString *currentCity;

@property(nonatomic, strong) WCSearchBar *searchBar;

@property(nonatomic, strong)NSArray *dataArray;
@property (strong, nonatomic)UIButton *cityBtn;

@property (strong, nonatomic) UIImageView *logoView;

@end

@implementation WCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutUI];
    
}


- (void)layoutUI{
    
    _cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cityBtn setTitle:@"深圳" forState:UIControlStateNormal];
    _cityBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_cityBtn setTitleColor:[UIColor colorWithRed:16./255.0 green:134./255.0 blue:255./255.0 alpha:1.0] forState:UIControlStateNormal];
    [_cityBtn setTitleColor:[UIColor colorWithRed:16./255.0 green:134./255.0 blue:255./255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [_cityBtn sizeToFit];
    [_cityBtn addTarget:self action:@selector(cityClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_cityBtn];
  
    
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    _logoView.image = [UIImage imageNamed:@"user"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_logoView];
    
    
    _searchBar = [[WCSearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 26)];
    _searchBar.placeholder = @"请输入搜索楼盘的名称";
    [_searchBar setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    self.tableView.tableHeaderView = self.bannerView;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];
    
}

- (void)initLocationManManager
{
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 10;
    //以此来判断，是否是ios8
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
        [_locationManager requestAlwaysAuthorization];//这句话ios8以上版本使用。
    }
    [_locationManager startUpdatingLocation];
}

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
     NSString *path = [[NSBundle mainBundle] pathForResource:@"house.plist" ofType:nil];
     NSArray *arrDict = [NSArray arrayWithContentsOfFile:path];
     NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in arrDict) {
          WCHomeEntity *entity = [WCHomeEntity houseWithDict:dict];
            [tempArr addObject:entity];
        }
       _dataArray = tempArr;
    }
    return _dataArray;
}


#pragma -mark--懒加载tabbleView
- (UIView *)bannerView
{
    if (!_bannerView)
    {
        _bannerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
        _bannerView.backgroundColor = [UIColor whiteColor];
        // 本地加载 --- 创建不带标题的图片轮播器
        NSArray *imageNames = @[@"001.jpg",
                                @"002.jpg",
                                @"003.jpg",
                                @"004.jpg"
                                ];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
        cycleScrollView.delegate = self;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        [_bannerView addSubview:cycleScrollView];
        cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _bannerView;
}


#pragma -mark--懒加载tabbleView
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = YES;

        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView registerNib:[UINib nibWithNibName:@"WCHomeCell1" bundle:nil] forCellReuseIdentifier:cellId1];
        [_tableView registerNib:[UINib nibWithNibName:@"WCHomeCell2" bundle:nil] forCellReuseIdentifier:cellId2];
        [_tableView registerNib:[UINib nibWithNibName:@"WCHomeCell3" bundle:nil] forCellReuseIdentifier:cellId3];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)cityClick:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"cityList" sender:self];
}

#pragma --mark--storyboard 跳转传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // segue.identifier：获取连线的ID
    if ([segue.identifier isEqualToString:@"cityList"])
    {
        // segue.destinationViewController：
        WCSelectedCityViewController *cityVC = segue.destinationViewController;
        cityVC.currentCity = _currentCity;
        cityVC.block = ^(NSString *city){
            [_cityBtn setTitle:city forState:UIControlStateNormal];
        };
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    // 根据经纬度反向得出位置城市信息
    //根据经纬度反向地理编译出地址信息
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0)
        {
            CLPlacemark *placemark = [array objectAtIndex:0];
            //获取城市
            NSString *city = placemark.locality;
            if (!city)
            {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            NSLog(@"当前城市是 = %@", city);
            _currentCity = city;
            
            [_cityBtn setTitle:city forState:UIControlStateNormal];
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self performSegueWithIdentifier:@"search" sender:self];
    return NO;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 2 ? self.dataArray.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
      WCHomeCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:cellId1 forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        NSArray *itemArray = @[@{@"item":@"房贷计算器",@"img":@"caculate"},
                               @{@"item":@"帮手小鑫",@"img":@"help"},
                               @{@"item":@"房产知识",@"img":@"reflence"}];
        
        cell1.block = ^(NSInteger itemTag){
            switch (itemTag) {
                case 0:
                {
                    [weakSelf performSegueWithIdentifier:@"caculate" sender:self];
                    break;
                }
                case 1:
                {
                    break;
                }
                case 2:
                {
                    break;
                }
                default:
                    break;
            }
        };
        cell1.array = itemArray;
        return cell1;
    }else if (indexPath.section == 1){
      WCHomeCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        return cell2;
    }else{
      WCHomeCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:cellId3 forIndexPath:indexPath];
      cell3.entity = self.dataArray[indexPath.row];
        return cell3;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100.;
    }else if (indexPath.section == 1){
        return 44.;
    }else{
        return 132.;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 0.000001;
    }else if (section == 1){
        return 10.;
    }else{
        return 44.;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        WCHomeHeadView *headView = [WCHomeHeadView initWithNib];
        headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44.);
        return headView;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
         [self performSegueWithIdentifier:@"activity" sender:self];
    }
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}

@end
