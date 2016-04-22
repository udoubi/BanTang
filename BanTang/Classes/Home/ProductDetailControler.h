//
//  ProductDetailControlerViewController.h
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "BaseViewController.h"

@interface ProductDetailControler : UIViewController<UINavigationControllerDelegate>
@property (nonatomic,strong) UIImageView *topImageView;
@property (nonatomic) CGRect topImgaeViewFrameInHomeView;
@property (nonatomic,strong) UITableView *tableView;
@end
