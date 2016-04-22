//
//  HomeTransitionAnimator.m
//  BanTang
//
//  Created by 江科 on 16/4/12.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomePushTransitionAnimator.h"
#import "HomeViewController.h"
#import "ProductDetailControler.h"
#import "HomeCell.h"

@interface HomePushTransitionAnimator()

@property (nonatomic,strong) id <UIViewControllerContextTransitioning>transitionContext;

@end

@implementation HomePushTransitionAnimator
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.transitionContext = transitionContext;
    UIView *containerView = [transitionContext containerView];
    HomeViewController *homeViewcontroller = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    homeViewcontroller.tabBarController.tabBar.hidden = YES;
    ProductDetailControler *productController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:productController.view];
    CGRect topViewFrame = productController.topImageView.frame;
    
    
    UITableView *tableView = homeViewcontroller.currentTableView;
    HomeCell *homeCell = (HomeCell *)[tableView cellForRowAtIndexPath:[tableView indexPathForSelectedRow]];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:homeCell.bigImageView.image];
    
    CGRect frameInSuperview = [homeCell.bigImageView convertRect:homeCell.bigImageView.frame toView:homeViewcontroller.view];
    productController.topImgaeViewFrameInHomeView = frameInSuperview;
    imageView.alpha = 0.0;
    imageView.frame = frameInSuperview;
    [containerView addSubview:imageView];

    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageView.frame = topViewFrame;
        imageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        productController.topImageView.image = imageView.image;
        [imageView removeFromSuperview];
    }];

    
}
@end
