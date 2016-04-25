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
#import "SquareHeadView.h"
#import "SquareData.h"
#import "SquareCell.h"
#import "SquareTableHeaderView.h"
#import "FollowViewController.h"

@interface SquareViewController ()<UITableViewDataSource,UITableViewDelegate,SquareTitleViewDelegate>
@property (nonatomic,strong) SquareData *squareData;
@property (nonatomic,strong) FollowViewController *followViewcontroller;
@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FollowViewController *followViewcontroller = [[FollowViewController alloc]init];
    [self addChildViewController:followViewcontroller];
    self.followViewcontroller = followViewcontroller;
    [self buildNavigationbar];
    [self loadData];
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
    titleView.delegate = self;
    self.navigationItem.titleView = titleView;
}
- (void)loadData {
    [SquareData loadSquareData:^(id data, NSError *error) {
        self.squareData = data;
        [self buildTableView];
    }];
}
- (void)buildTableView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = (Width - 20) * 0.38;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    SquareHeadView *headView = [[SquareHeadView alloc]initWithSquareData:self.squareData];
    headView.frame = CGRectMake(0, 0, Width, 235);
    tableView.tableHeaderView = headView;
}
#pragma tableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.squareData.rec_groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SquareCell *cell = [SquareCell cellWithTableView:tableView];
    cell.group = self.squareData.rec_groups[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[SquareTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, Width, 35)];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 35;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[SquareTableFooterView alloc]initWithFrame:CGRectMake(0, 0, Width, 25)];
}
#pragma callback
- (void)didSquareTitleViewDelegate:(SquareTitleView *)button atIndex:(NSInteger)index {
    if (index == 1) {
        [self.view addSubview:self.followViewcontroller.view];
    }else{
        [self.followViewcontroller.view removeFromSuperview];
    }
}

- (void)searchBtnCliked {}
- (void)addBtnCliked {}
@end
