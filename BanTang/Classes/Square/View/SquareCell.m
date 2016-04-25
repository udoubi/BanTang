//
//  SquareCell.m
//  BanTang
//
//  Created by 江科 on 16/4/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "SquareCell.h"

@interface SquareCell()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *postsLabel;
@property (nonatomic,strong) UILabel *viewsLabel;

@end

@implementation SquareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *bgImageView = [[UIImageView alloc]init];
        
        UILabel *nameLabel = [UILabel new];
        nameLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        nameLabel.layer.borderWidth = 1;
        nameLabel.layer.cornerRadius = 3;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont fontWithName:ThinFont size:14];
        UILabel *postsLabel = [UILabel new];
        [postsLabel sizeToFit];
        postsLabel.textColor = [UIColor whiteColor];
        postsLabel.font = [UIFont fontWithName:ThinFont size:11];
        UILabel *viewsLabel = [UILabel new];
        [viewsLabel sizeToFit];
        viewsLabel.textColor = [UIColor whiteColor];
        viewsLabel.font = [UIFont fontWithName:ThinFont size:11];
        
        [self addSubview:bgImageView];
        [self addSubview:nameLabel];
        [self addSubview:postsLabel];
        [self addSubview:viewsLabel];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(160, 25));
        }];
        [viewsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(nameLabel.mas_bottom).offset(5);
            make.leading.equalTo(nameLabel.mas_leading).offset(15);
        }];
        [postsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(viewsLabel.mas_trailing).offset(10);
            make.top.equalTo(viewsLabel);
        }];
        
        self.bgImageView = bgImageView;
        self.nameLabel = nameLabel;
        self.postsLabel = postsLabel;
        self.viewsLabel = viewsLabel;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    SquareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[SquareCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
    
}
- (void)setGroup:(SquareGroup *)group {
    [self.bgImageView setImageWithURL:[NSURL URLWithString:group.pic2] placeholderImage:nil animate:YES];
    self.nameLabel.text = group.name;
    self.postsLabel.text = [NSString stringWithFormat:@"%@帖子",group.dynamic.posts];
    self.viewsLabel.text = [NSString stringWithFormat:@"%@浏览",group.dynamic.views];;
}
@end
