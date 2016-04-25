//
//  MessageViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MessageViewController.h"

static NSString * const cellId = @"cell";

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *imageArray;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"消息";
    self.titleArray = @[@"新的粉丝",@"新的评论",@"新的喜欢",@"新的奖励",@"新的通知"];
    self.imageArray = @[@"icon_message_user",@"icon_message_comment",@"icon_message_like",@"icon_message_reward",@"icon_message_notification"];
    
    [self buildTableView];

}
- (void)buildTableView {
    UITableView *tb = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tb.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 1)];
    tb.delegate = self;
    tb.dataSource = self;
    tb.separatorColor = [UIColor colorWithWhite:0.934 alpha:1.000];
    tb.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [tb registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:tb];
    [tb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma tableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont fontWithName:ThinFont size:14];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseViewController *ctr = [BaseViewController new];
    ctr.title = self.titleArray[indexPath.row];
    [self.navigationController pushViewController:ctr animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
