//
//  PhotoCell.m
//  PhotoDemo
//
//  Created by 江科 on 16/4/19.
//  Copyright © 2016年 江科. All rights reserved.
//

#import "PhotoCell.h"
#import "Masonry.h"
#import "ZLPhotoTool.h"

@interface PhotoCell()
@property (nonatomic,strong) UIImageView *bgimageView;

@end

@implementation PhotoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgimageView = [[UIImageView alloc]init];
        bgimageView.contentMode = UIViewContentModeScaleAspectFill;
        bgimageView.layer.cornerRadius = 3;
        bgimageView.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *statusImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BoAssetsPickerChecked"]];
        statusImageView.hidden =YES;
        [self addSubview:bgimageView];
        [self addSubview:statusImageView];
        [bgimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [statusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-5);
            make.trailing.equalTo(self).offset(-5);
        }];
        self.bgimageView = bgimageView;
        self.statusImageView = statusImageView;
    }
    return self;
}
- (void)setImage:(UIImage *)image {
    self.bgimageView.image = image;
}

@end
