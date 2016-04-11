//
//  UserRecomendCell.h
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserRecomendData.h"
@interface UserRecomendCell : UITableViewCell

@property (nonatomic,strong) UserRecomend *recomend;
+ (instancetype)cellWithTableView:(UITableView *)tableView ;
@end
