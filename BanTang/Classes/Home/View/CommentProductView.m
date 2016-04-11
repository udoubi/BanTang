//
//  CommentProductView.m
//  BanTang
//
//  Created by 江科 on 16/4/7.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "CommentProductView.h"

@interface CommentProductView()

@property (nonatomic,strong) UIImageView *picImageView;

@property (nonatomic,strong) UILabel *plateformLabel;

@property (nonatomic,strong) UILabel *keyWordsLabel;

@property (nonatomic,strong) UILabel *priceLabel;
@end

@implementation CommentProductView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *picImageView = [[UIImageView alloc]init];
        
        UILabel *plateformLabel = [[UILabel alloc]init];
        plateformLabel.font = [UIFont fontWithName:LightFont size:13];
        plateformLabel.textColor = [UIColor darkGrayColor];
        [plateformLabel sizeToFit];
        
        UIView *linView = [[UIView alloc]init];
        linView.backgroundColor = [UIColor lightGrayColor];
        
        UILabel *keyWordsLabel = [[UILabel alloc]init];
        keyWordsLabel.font = [UIFont fontWithName:LightFont size:13];
        keyWordsLabel.textColor = [UIColor blackColor];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.font = [UIFont fontWithName:LightFont size:11];
        priceLabel.textColor = [UIColor redColor];
        
        
        [self addSubview:picImageView];
        [self addSubview:plateformLabel];
        [self addSubview:linView];
        [self addSubview:keyWordsLabel];
        [self addSubview:priceLabel];
        
        [picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.bottom.equalTo(self);
            make.width.equalTo(self.mas_height);
        }];
        
        [plateformLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(picImageView.mas_trailing).offset(10);
            make.top.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(30, 20));
        }];
        [linView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(1, 10));
            make.leading.equalTo(plateformLabel.mas_trailing);
            make.centerY.equalTo(plateformLabel);
        }];
        [keyWordsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(linView.mas_trailing).offset(5);
            make.size.mas_equalTo(CGSizeMake(30, 20));
            make.top.equalTo(plateformLabel);
        }];
        
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(plateformLabel);
            make.bottom.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        
        
        self.picImageView = picImageView;
        self.plateformLabel = plateformLabel;
        self.keyWordsLabel = keyWordsLabel;
        self.priceLabel = priceLabel;

    }
    return self;
}


- (void)setProduct:(RelateProduct *)product {
    
    [self.picImageView setImageWithURL:[NSURL URLWithString:product.pic] placeholderImage:nil];
    self.keyWordsLabel.text = @"测试";
    self.plateformLabel.text = @"淘宝";
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",product.price];;
}
@end
