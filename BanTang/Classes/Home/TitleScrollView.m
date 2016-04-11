//
//  TitleScrollView.m
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "TitleScrollView.h"

@interface TitleScrollView()

@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIScrollView *titleScrollView;
@property (nonatomic,assign) CGFloat itemWidth;
@end

@implementation TitleScrollView

- (instancetype)initWithTitleArray:(NSArray *)titleArray itemWidth:(CGFloat)itemWidth{
    if (self = [super init]) {
        self.itemWidth = itemWidth;
        _titleScrollView = [[UIScrollView alloc]init];
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_titleScrollView];
        
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [_titleScrollView addSubview:_contentView];

        for (NSInteger i = 0; i < titleArray.count; i ++) {
            UILabel *titleLabel = [[UILabel alloc]init];
            titleLabel.text = titleArray[i];
            titleLabel.font = [UIFont fontWithName:ThinFont size:14];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleLabelCliked:)];
            titleLabel.userInteractionEnabled = YES;
            titleLabel.highlightedTextColor = [UIColor redColor];
            [titleLabel addGestureRecognizer:tap];
            titleLabel.tag = i;
            [_contentView addSubview:titleLabel];
        }
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor redColor];
        [_contentView addSubview:_lineView];
        
        [_titleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_titleScrollView);
            make.height.equalTo(_titleScrollView.mas_height);
        }];
        
        UILabel *lastLabel;
        for (NSInteger i = 0; i < _contentView.subviews.count - 1; i ++) {
            UILabel *label = _contentView.subviews[i];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(lastLabel? lastLabel.mas_trailing : @0);
                make.width.mas_equalTo(itemWidth);
                make.height.mas_equalTo(30);
                make.centerY.equalTo(self);
            }];
            lastLabel = label;
        }
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(lastLabel);
        }];
        UILabel *firstLabel = _contentView.subviews[0];
        firstLabel.highlighted = YES;
        firstLabel.font = [UIFont fontWithName:ThinFont size:15];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(itemWidth * 0.6);
            make.height.mas_equalTo(2);
            make.centerX.equalTo(firstLabel);
            make.top.equalTo(firstLabel.mas_bottom);
        }];
    }
    return self;
}
- (void)titleLabelCliked:(UITapGestureRecognizer *)tap {
    NSInteger index = tap.view.tag;
    [self titleScrollViewScrollTo:index];
    if (self.delegate) {
        [self.delegate didTitleScrollViewCliked:self atIndex:index];
    }
}
- (void)titleScrollViewScrollTo:(NSInteger)index {
    for (NSInteger i = 0; i < _contentView.subviews.count - 1; i ++) {
        UILabel *label = _contentView.subviews[i];
        label.highlighted = NO;
        label.font = [UIFont fontWithName:ThinFont size:14];
    }
    
    UILabel *label = self.contentView.subviews[index];
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.itemWidth * 0.6);
        make.height.mas_equalTo(2);
        make.centerX.equalTo(label);
        make.top.equalTo(label.mas_bottom);
    }];
    [self.lineView setNeedsLayout];
    [UIView animateWithDuration:0.5 animations:^{
        [self.lineView layoutIfNeeded];
        label.highlighted = YES;
        label.font = [UIFont fontWithName:ThinFont size:15];
    }];
    
    CGFloat leftOffset = CGRectGetMidX(label.frame) - CGRectGetWidth(self.bounds) / 2;
    CGFloat rightOffset = CGRectGetWidth(self.bounds) / 2 + CGRectGetMidX(label.frame) - CGRectGetWidth(self.contentView.frame);
    // 偏移量
    if (leftOffset >= 0 && rightOffset <= 0) {
        [self.titleScrollView setContentOffset:CGPointMake(leftOffset, 0) animated:YES];
    }else{
        [self.titleScrollView setContentOffset:CGPointMake((leftOffset >= 0? :0), 0) animated:YES];
        [self.titleScrollView setContentOffset:CGPointMake((rightOffset <= 0? :CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.bounds)), 0) animated:YES];
    }
}

@end
