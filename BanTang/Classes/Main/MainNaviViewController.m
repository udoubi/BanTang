//
//  MainNaviViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/26.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MainNaviViewController.h"

@interface MainNaviViewController ()

@end

@implementation MainNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIBarButtonItem *bakcItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButtonCliked)];
        viewController.navigationItem.leftBarButtonItem = bakcItem;
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:YES];
}
- (void)backButtonCliked {
    [self popViewControllerAnimated:YES];
}
@end
