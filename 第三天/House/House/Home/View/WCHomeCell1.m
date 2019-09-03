//
//  WCHomeCell1.m
//  House
//
//  Created by zcds2 on 2016/11/23.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCHomeCell1.h"
#import "WCHomeSubCell.h"

static NSString *const cellId = @"Cell";
@interface WCHomeCell1()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WCHomeCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    [self layoutUI];
}

- (void)setArray:(NSArray *)array
{
    _array = array;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.collectionView reloadData];
    });
}

- (void)layoutUI
{
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3., 100.);
    flowLayout.minimumLineSpacing = 0.000001;
    flowLayout.minimumInteritemSpacing = 0.000001;
    flowLayout.headerReferenceSize = CGSizeZero;
    flowLayout.footerReferenceSize = CGSizeZero;
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.scrollEnabled = NO;
    _collectionView.bounces = NO;
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:@"WCHomeSubCell" bundle:nil]forCellWithReuseIdentifier:cellId];
}


#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   WCHomeSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    NSDictionary *dict = _array[indexPath.item];
    
    cell.titleLabel.text = dict[@"item"];
    cell.imgView.image = [UIImage imageNamed:dict[@"img"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_block) {
        _block(indexPath.item);
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
