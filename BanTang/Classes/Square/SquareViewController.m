//
//  SquareViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareViewController.h"
#import "CommentItemView.h"
#import "UIBarButtonItem+Extension.h"
#import "SquareTitleView.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma build views
- (void)buildNavigationbar {
    UIBarButtonItem *searchItem = [UIBarButtonItem barBtnItemWithNmlImg:@"searchBtn" hltImg:@"searchBtn" target:self action:@selector(searchBtnCliked)];
    UIBarButtonItem *addItem = [UIBarButtonItem barBtnItemWithNmlImg:@"community_add_friend" hltImg:@"community_add_friend" target:self action:@selector(addBtnCliked)];
    self.navigationItem.leftBarButtonItem = searchItem;
    self.navigationItem.rightBarButtonItem = addItem;
    
    SquareTitleView *titleView = [[SquareTitleView alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    self.navigationItem.titleView = titleView;
}
- (void)searchBtnCliked {}
- (void)addBtnCliked {}
@end
