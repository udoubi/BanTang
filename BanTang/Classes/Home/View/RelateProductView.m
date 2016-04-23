//
//  RelateProductView.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "RelateProductView.h"

@interface RelateProductView()

@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UIImageView *platformImageView;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *plateformLabel;
@property (nonatomic,strong) UILabel *priceLabel;

@end

@implementation RelateProductView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *picImageView = [[UIImageView alloc]init];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont fontWithName:LightFont size:13];
        
        UIImageView *platformImageView = [[UIImageView alloc]init];
        
        
        UILabel *plateformLabel = [[UILabel alloc]init];
        plateformLabel.font = [UIFont fontWithName:ThinFont size:12];
        plateformLabel.textColor = [UIColor darkGrayColor];
        
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.font = [UIFont fontWithName:ThinFont size:12];
        priceLabel.textColor = [UIColor redColor];
        
        
        [self addSubview:picImageView];
        [self addSubview:titleLabel];
        [self addSubview:platformImageView];
        [self addSubview:plateformLabel];
        [self addSubview:priceLabel];
        
        
        [picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.bottom.equalTo(self);
            make.width.equalTo(self.mas_height);
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(picImageView.mas_trailing).offset(10);
            make.top.equalTo(self).offset(5);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        
        [platformImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(titleLabel);
            make.bottom.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        [plateformLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(platformImageView.mas_trailing).offset(5);
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.centerY.equalTo(platformImageView);
        }];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(plateformLabel.mas_trailing).offset(5);
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.centerY.equalTo(platformImageView);
        }];
        
        
        
        
        self.picImageView = picImageView;
        self.titleLabel = titleLabel;
        self.plateformLabel = plateformLabel;
        self.platformImageView = platformImageView;
        self.priceLabel = priceLabel;
    }
    return self;
}

- (void)setProduct:(RelateProduct *)product {
    [self.picImageView setImageWithURL:[NSURL URLWithString:product.pic] placeholderImage:nil animate:YES];
    self.titleLabel.text = product.title;
    self.platformImageView.image = [UIImage imageNamed:@"icon_product_source_taobao"];
    self.plateformLabel.text = @"来自淘宝";
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",product.price];
}
@end
