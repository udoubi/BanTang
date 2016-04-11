//
//  ProductLikesView.m
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductLikesView.h"

/** 头像大小  */
static const CGFloat likeIconWH = 25;
/** 剪头宽度  */
static const CGFloat arrowIconW = 27;
/** 头像间距  */
static const CGFloat defaultMargin = 10;
@interface ProductLikesView()
@property (nonatomic,strong) UILabel *likes;
@property (nonatomic,strong) NSMutableArray *imageViewArray;
@property (nonatomic,assign) NSInteger maxNum;
@property (nonatomic,strong) UILabel *likeLabel;
@end

@implementation ProductLikesView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _likeLabel = [[UILabel alloc]init];
        _likeLabel.font = [UIFont fontWithName:ThinFont size:11];
        [self addSubview:_likeLabel];
        
        [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self).offset(10);
            make.top.equalTo(self).offset(5);
            make.height.mas_equalTo(20);
        }];
        
        _maxNum = (Width - 2 * 10 - arrowIconW) / (likeIconWH + 2 * defaultMargin);
        
        UIImageView *lastView;
        for (NSInteger i = 0; i< _maxNum; i++) {
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.layer.cornerRadius = likeIconWH * 0.5;
            imageView.layer.masksToBounds = YES;
            [self addSubview:imageView];
            [self.imageViewArray addObject:imageView];
            
            
            if (!lastView) {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(@10);
                }];
            }else{
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.leading.equalTo(lastView.mas_trailing).offset(defaultMargin);
                }];
            }
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(likeIconWH, likeIconWH));
                make.top.equalTo(_likeLabel.mas_bottom).offset(10);
            }];
            lastView = imageView;
        }
        
        UIImageView *arraowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"subject_arrow_right"]];
        [self addSubview:arraowImageView];
        [arraowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(14 , 17));
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(lastView);
        }];
        
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0].CGColor;
    }
    return self;
}
- (NSMutableArray *)imageViewArray
{
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray array];
    }
    return  _imageViewArray;
}

- (void)setProduct:(ProductDetail *)product {
    
    self.likeLabel.text = [NSString stringWithFormat:@"%@人喜欢",product.likes];
    
    NSInteger count = product.likes_list.count > self.maxNum? self.maxNum : product.likes_list.count;
    
    for (NSInteger i = 0; i < count; i++) {
        UIImageView *imageView = self.imageViewArray[i];
        NSString *imageName = [NSString stringWithFormat:@"%@%@",self.userAvatrHost,product.likes_list[i].a];
        [imageView setImageWithURL:[NSURL URLWithString:imageName ]placeholderImage:nil];
    }
}
@end
