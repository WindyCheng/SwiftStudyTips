//
//  WCHomeCell3.m
//  House
//
//  Created by zcds2 on 2016/11/23.
//  Copyright © 2016年 Windy. All rights reserved.
//

#import "WCHomeCell3.h"
#import "WCHomeEntity.h"

@interface WCHomeCell3()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *flagLabel;

@property (weak, nonatomic) IBOutlet UILabel *regionLabel;

@property (weak, nonatomic) IBOutlet UILabel *squareLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

@implementation WCHomeCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setEntity:(WCHomeEntity *)entity
{
    _entity = entity;
    _imgView.image = [UIImage imageNamed:_entity.img];
    _nameLabel.text = _entity.houseName;
    _regionLabel.text = _entity.region;
    _squareLabel.text = _entity.square;
    _priceLabel.text = _entity.price;
    _desLabel.text = _entity.des;
    
    if ([_entity.onSell isEqual:@(1)]) {
        _flagLabel.text = @"在售";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
