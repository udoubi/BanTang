//
//  MineHeadView.m
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MineHeadTopView.h"
#import "MineTitleButton.h"

@interface MineHeadTopView()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIImageView *headView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *signLabel;
@property (nonatomic,strong) MineTitleButton *achievementBtn;
@property (nonatomic,strong) MineTitleButton *attentionsBtn;
@property (nonatomic,strong) MineTitleButton *fansBtn;
@end

@implementation MineHeadTopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgImageView = [[UIImageView alloc]init];
        UIImageView *headView = [[UIImageView alloc]init];
        headView.layer.cornerRadius = 30;
        headView.layer.masksToBounds = YES;
        headView.layer.borderWidth = 1;
        headView.layer.borderColor = [UIColor whiteColor].CGColor;
        UILabel *nameLabel = [UILabel new];
        nameLabel.font = [UIFont fontWithName:RegularFont size:14];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        UILabel *signLabel = [UILabel new];
        signLabel.font = [UIFont fontWithName:ThinFont size:12];
        signLabel.textColor = [UIColor whiteColor];
        signLabel.textAlignment = NSTextAlignmentCenter;
        UIView *boxView = [UIView new];
        
        [self addSubview:bgImageView];
        [self addSubview:headView];
        [self addSubview:nameLabel];
        [self addSubview:signLabel];
        [self addSubview:boxView];
        
        MineTitleButton *achievementBtn = [[MineTitleButton alloc]initWithTitle:@"成就"];
        MineTitleButton *attentionsBtn = [[MineTitleButton alloc]initWithTitle:@"上精选"];
        MineTitleButton *fansBtn = [[MineTitleButton alloc]initWithTitle:@"获赞"];
        [boxView addSubview:achievementBtn];
        [boxView addSubview:attentionsBtn];
        [boxView addSubview:fansBtn];
        [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self);
            make.height.mas_equalTo(60);
        }];
        [achievementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.bottom.equalTo(boxView);
            make.width.mas_equalTo(Width / 3);
        }];
        
        [attentionsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(boxView);
            make.width.mas_equalTo(Width / 3);
            make.leading.equalTo(achievementBtn.mas_trailing);
        }];
        
        [fansBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(boxView);
            make.width.mas_equalTo(Width / 3);
            make.leading.equalTo(attentionsBtn.mas_trailing);
        }];
        
        [signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(boxView.mas_top).offset(-10);
            make.leading.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.bottom.equalTo(signLabel.mas_top).offset(-6);
            make.height.mas_equalTo(20);
        }];
        [headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.centerX.equalTo(self);
            make.bottom.equalTo(nameLabel.mas_top).offset(-10);
        }];
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        self.bgImageView = bgImageView;
        self.headView = headView;
        self.nameLabel = nameLabel;
        self.signLabel = signLabel;
        self.achievementBtn = achievementBtn;
        self.attentionsBtn = attentionsBtn;
        self.fansBtn = fansBtn;
    }
    return self;
}

- (void)setUserInfo:(UserInfoData *)userInfo {
    [self.bgImageView setImageWithURL:[NSURL URLWithString:userInfo.user_cover] placeholderImage:nil animate:NO];
    [self.headView setImageWithURL:[NSURL URLWithString:userInfo.avatar] placeholderImage:nil animate:NO];
    self.nameLabel.text = userInfo.nickname;
    self.signLabel.text = userInfo.user_sign;
    self.achievementBtn.count = userInfo.attention_type;
    self.attentionsBtn.count = userInfo.attentions;
    self.fansBtn.count = userInfo.fans;
}
@end
