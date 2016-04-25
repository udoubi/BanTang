//
//  SquareTitleView.h
//  BanTang
//
//  Created by 江科 on 16/4/22.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SquareTitleView;


@protocol SquareTitleViewDelegate <NSObject>

- (void)didSquareTitleViewDelegate:(SquareTitleView *)button atIndex:(NSInteger)index;

@end

@interface SquareTitleViewButton : UIButton

@end

@interface SquareTitleView : UIView

@property (nonatomic,strong) id<SquareTitleViewDelegate> delegate;
@end
