//
//  ProductPicView.m
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductPicView.h"

@interface ProductPicView()

@property (nonatomic,strong) UIImageView *oneImageView;;
@property (nonatomic,strong) UIImageView *towImageView;;

@end

@implementation ProductPicView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _oneImageView = [[UIImageView alloc]init];
        _towImageView = [[UIImageView alloc]init];
        [self addSubview:_oneImageView];
        [self addSubview:_towImageView];
        [_oneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(self.mas_width);
        }];
        [_towImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(_oneImageView.mas_bottom).offset(10);
            make.height.equalTo(self.mas_width);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}
- (void)setImages:(NSArray<PicModel *> *)images {
    if (images.count == 2) {
        [self.oneImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.picUrlHost,images[0].p]] placeholderImage:nil animate:YES];
        [self.towImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.picUrlHost,images[1].p]]placeholderImage:nil animate:YES];
    }else {
        [self.oneImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.picUrlHost,images[0].p]] placeholderImage:nil animate:YES];
        [self.towImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(_oneImageView.mas_bottom).offset(10);
            make.height.equalTo(@0);
            make.bottom.equalTo(self);
        }];
    }
    
}
@end
