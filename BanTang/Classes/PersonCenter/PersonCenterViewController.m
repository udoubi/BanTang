//
//  PersonCenterViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "UINavigationBar+Extension.h"
#import "UserInfoData.h"
#import "MineHeadTopView.h"
#import "HomeHotView.h"
#import "TitleScrollView.h"

static CGFloat const kTitleScrollViewH = 40;

@interface PersonCenterViewController ()<UIScrollViewDelegate>

@property (nonatomic,assign) CGFloat navigationBarAlpha;
@property (nonatomic,strong) UserInfoData *userInfo;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIView *detailView;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) TitleScrollView *titleView;
@property (nonatomic,strong) MineHeadTopView *topView;
@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationbar];
    [self loadData];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
    [self.navigationController.navigationBar zz_setTitleViewAlpha:self.navigationBarAlpha];
}
- (void)buildNavigationbar {
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationItem.title = @"个人中心";
    UIBarButtonItem *settingItem = [UIBarButtonItem barBtnItemWithNmlImg:@"settingicon" hltImg:@"settingicon" target:self action:@selector(settingBtnCliked)];
    self.navigationItem.rightBarButtonItem = settingItem;
}
- (void)loadData {
    [UserInfoData loaduUserData:^(id data, NSError *error) {
        self.userInfo = data;
//        MineHeadView *headView = [[MineHeadView alloc]init];
//        headView.userInfo = data;
//        self.headView = headView;
//        [self.contentView addSubview:headView];
        
        [self.contentView addSubview:self.detailView];
        
        [self.view addSubview:self.headView];
        
        [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self.view);
        }];
        
        MineHeadTopView *topView = [[MineHeadTopView alloc]init];
        topView.userInfo = data;
        self.topView = topView;
        NSArray *titles = @[@"订单",@"好友",@"积分",@"小分队"];
        NSArray *images = @[@"center_menu_order_icon",@"center_menu_fans_icon",@"center_menu_jifen_icon",@"center_menu_xiaofendui_icon"];
        
        HomeHotView *hotView = [[HomeHotView alloc]initWithTitles:titles images:images];
        NSArray *subTitles = @[@"单品",@"清单",@"互动",@"发布"];
        
        TitleScrollView *titleView = [[TitleScrollView alloc]initWithTitleArray:subTitles itemWidth:Width / 4];
        titleView.layer.borderWidth = 0.5;
        titleView.layer.borderColor = [UIColor colorWithWhite:0.977 alpha:1.000].CGColor;
        self.titleView = titleView;
        [self.headView addSubview:topView];
        [self.headView addSubview:hotView];
        [self.headView addSubview:titleView];
        
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self.headView);
            make.height.mas_equalTo(Width * 0.66);
        }];
        [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(topView.mas_bottom);
            make.leading.trailing.equalTo(self.headView);
        }];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(hotView.mas_bottom);
            make.height.mas_equalTo(kTitleScrollViewH);
            make.leading.trailing.bottom.equalTo(self.headView);
        }];
        [self.headView layoutIfNeeded];
        
        [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(CGRectGetMaxY(self.headView.frame));
            make.leading.trailing.equalTo(self.contentView);
            make.height.mas_equalTo(Height - 49 - 64 - kTitleScrollViewH);
            make.bottom.equalTo(self.contentView);
        }];
    }];
}
- (UIView *)headView {
    if (_headView == nil) {
        _headView = [[UIView alloc]init];
        _headView.userInteractionEnabled = YES;
    }
    return _headView;
}
- (UIView *)detailView {
    if (_detailView == nil) {
        _detailView = [[UIView alloc]init];
    }
    return _detailView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        UIScrollView *mainScrollView = [[UIScrollView alloc]init];
        mainScrollView.delegate = self;
        mainScrollView.showsVerticalScrollIndicator = NO;
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:mainScrollView];
        [mainScrollView addSubview:_contentView];
        [mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(mainScrollView);
            make.width.equalTo(mainScrollView);
        }];
    }
    return _contentView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = scrollView.contentOffset.y;
    if (offset > 0) {
        // 顶部的向上滑动
        [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(-offset);
        }];
    }else if(offset < 0){
        //图片的缩放效果
        CGFloat offsetX = ((Width * 0.66 - offset) / (Width * 0.66) * Width - Width) / 2;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(Width * 0.66 - offset);
            make.leading.equalTo(self.view).offset(-offsetX);
            make.trailing.equalTo(self.view).offset(offsetX);
        }];
    }
    
    // 改变导航栏的透明度
    CGFloat alpha = offset / 160;
    self.navigationBarAlpha = MIN(1, alpha);
    [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
    [self.navigationController.navigationBar zz_setTitleViewAlpha:self.navigationBarAlpha];
}
- (void)settingBtnCliked {}

@end
