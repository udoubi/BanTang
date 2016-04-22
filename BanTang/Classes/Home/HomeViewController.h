//
//  HomeViewController.h
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController : BaseViewController<UINavigationControllerDelegate>

@property (nonatomic,strong) UITableView *currentTableView;
@end
