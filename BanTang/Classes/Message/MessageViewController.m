//
//  MessageViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MessageViewController.h"
#import "LoadingView.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoadingView *view = [[LoadingView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    [self.view addSubview:view];
    [view startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
