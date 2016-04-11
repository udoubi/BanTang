//
//  MainTabBarController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "SquareViewController.h"
#import "ShowViewController.h"
#import "MessageViewController.h"
#import "PersonCenterViewController.h"
#import "MainNaviViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTabbarController];
}

- (void)buildTabbarController{
    [self addChildViewController:[HomeViewController new] image:[UIImage imageNamed:@"Home_unselected"] selectedImage:[UIImage imageNamed:@"Home_selected"]];
    [self addChildViewController:[SquareViewController new] image:[UIImage imageNamed:@"Square_normal"] selectedImage:[UIImage imageNamed:@"Square_selected"]];
    [self addChildViewController:[ShowViewController new] image:[UIImage imageNamed:@"Show_normal"] selectedImage:nil];
    [self addChildViewController:[MessageViewController new] image:[UIImage imageNamed:@"Message_normal"] selectedImage:[UIImage imageNamed:@"Message_selected"]];
    [self addChildViewController:[PersonCenterViewController new] image:[UIImage imageNamed:@"PersonCenter_unlogin"] selectedImage:nil];
}

- (void)addChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = image;
    item.title = nil;
    item.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    item.selectedImage = selectedImage;
    viewController.tabBarItem = item;
    MainNaviViewController *navController = [[MainNaviViewController alloc]initWithRootViewController:viewController];
    [self addChildViewController:navController];
}
@end
