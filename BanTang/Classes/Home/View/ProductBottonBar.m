//
//  ProductBottonBar.m
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductBottonBar.h"

@interface ProductBottonBar()

@property (nonatomic,strong) UIButton *commentButton;
@property (nonatomic,strong) UIButton *likeButton;
@property (nonatomic,strong) UIButton *buyButton;

@end

@implementation ProductBottonBar

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        UIButton *commnetButton = [[UIButton alloc]init];
        [commnetButton setImage:[UIImage imageNamed:@"product_not_commenticon"] forState:UIControlStateNormal];
        [commnetButton setTitleColor:[UIColor getColor:@"727272"] forState:UIControlStateNormal];
        commnetButton.titleLabel.font = [UIFont fontWithName:ThinFont size:16];
        commnetButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self addSubview:commnetButton];
        
        UIButton *likeButton = [[UIButton alloc]init];
        [likeButton setImage:[UIImage imageNamed:@"product_item_not_likeicon"] forState:UIControlStateNormal];
        [likeButton setTitleColor:[UIColor getColor:@"727272"] forState:UIControlStateNormal];
        likeButton.titleLabel.font = [UIFont fontWithName:ThinFont size:16];
        likeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self addSubview:likeButton];
        
        
        UIButton *buyButton = [[UIButton alloc]init];
        [buyButton setImage:[UIImage imageNamed:@"tools_taobao"] forState:UIControlStateNormal];
        buyButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        [self addSubview:buyButton];
        
        CGFloat buttonW = Width / 3;
        
        [commnetButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(buttonW, 50));
            make.centerY.equalTo(self);
        }];
        
        [likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(commnetButton.mas_trailing);
            make.size.mas_equalTo(CGSizeMake(buttonW, 50));
            make.centerY.equalTo(self);
        }];
        
        [buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(likeButton.mas_trailing);
            make.size.mas_equalTo(CGSizeMake(buttonW, 50));
            make.centerY.equalTo(self);
        }];
        
        self.commentButton = commnetButton;
        self.likeButton = likeButton;
        self.buyButton = buyButton;
        
    }
    return self;
}

- (void)setProduct:(ProductDetail *)product {
    [self.commentButton setTitle:product.comments forState:UIControlStateNormal];
    [self.likeButton setTitle:product.likes forState:UIControlStateNormal];
}

@end
