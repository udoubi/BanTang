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
@interface PersonCenterViewController ()

@property (nonatomic,assign) CGFloat navigationBarAlpha;
@property (nonatomic,strong) UserInfoData *userInfo;
@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationbar];
    [self loadData];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
    [self.navigationController.navigationBar zz_setElementAlpha:self.navigationBarAlpha];
}
- (void)buildNavigationbar {
    self.navigationItem.title = @"个人中心";
    UIBarButtonItem *settingItem = [UIBarButtonItem barBtnItemWithNmlImg:@"settingicon" hltImg:@"settingicon" target:self action:@selector(settingBtnCliked)];
    self.navigationItem.rightBarButtonItem = settingItem;
}
- (void)loadData {
    [UserInfoData loaduUserData:^(id data, NSError *error) {
        self.userInfo = data;
        MineHeadTopView *headView = [[MineHeadTopView alloc]initWithFrame:CGRectMake(0, 0, Width, Width * 0.8125)];
        headView.userInfo = data;
        [self.view addSubview:headView];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)settingBtnCliked {}

@end
