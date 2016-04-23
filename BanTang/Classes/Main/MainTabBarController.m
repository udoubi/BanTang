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
#import "MessageViewController.h"
#import "PersonCenterViewController.h"
#import "MainNaviViewController.h"
#import "PhotoController.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [self buildTabbarController];
}

- (void)buildTabbarController{
    [self addChildViewController:[HomeViewController new] image:[UIImage imageNamed:@"Home_unselected"] selectedImage:[UIImage imageNamed:@"Home_selected"] tag:0];
    [self addChildViewController:[SquareViewController new] image:[UIImage imageNamed:@"Square_normal"] selectedImage:[UIImage imageNamed:@"Square_selected"] tag:1];
    [self addChildViewController:[UIViewController new] image:[UIImage imageNamed:@"Show_normal"] selectedImage:nil tag:2];
    [self addChildViewController:[MessageViewController new] image:[UIImage imageNamed:@"Message_normal"] selectedImage:[UIImage imageNamed:@"Message_selected"] tag:3];
    [self addChildViewController:[PersonCenterViewController new] image:[UIImage imageNamed:@"PersonCenter_unlogin"] selectedImage:nil tag:4];
}

- (void)addChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)tag{
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = image;
    item.title = nil;
    item.tag = tag;
    item.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    item.selectedImage = selectedImage;
    viewController.tabBarItem = item;
    MainNaviViewController *navController = [[MainNaviViewController alloc]initWithRootViewController:viewController];
    [self addChildViewController:navController];
}
#pragma TabBar delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (viewController.tabBarItem.tag == 2) {
        MainNaviViewController *nav = [[MainNaviViewController alloc]initWithRootViewController:[PhotoController new]];
        [self presentViewController:nav animated:YES completion:nil];
        return NO;
    }
    return YES;
}

@end
