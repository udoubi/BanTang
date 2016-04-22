//
//  HomePopTransitionAnimator.m
//  BanTang
//
//  Created by 江科 on 16/4/13.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomePopTransitionAnimator.h"
#import "HomeViewController.h"
#import "ProductDetailControler.h"
#import "HomeCell.h"

@implementation HomePopTransitionAnimator
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    HomeViewController *homeViewcontroller = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    homeViewcontroller.tabBarController.tabBar.hidden = YES;
    ProductDetailControler *productController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIImageView *imageView = productController.topImageView;
    [containerView addSubview:imageView];
    
    UITableView *tableView = homeViewcontroller.currentTableView;
    HomeCell *cell = [tableView cellForRowAtIndexPath:[tableView indexPathForSelectedRow]];
    homeViewcontroller.view.alpha = 0.0;
    [containerView addSubview:homeViewcontroller.view];
    CGRect frameInSuperview = [cell.bigImageView convertRect:cell.bigImageView.frame toView:homeViewcontroller.view];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageView.frame = frameInSuperview;
        imageView.alpha = 0.0;
        homeViewcontroller.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        homeViewcontroller.tabBarController.tabBar.hidden = NO;
        [imageView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
