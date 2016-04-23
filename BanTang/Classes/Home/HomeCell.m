//
//  HomeCell.m
//  BanTang
//
//  Created by 天空之城 on 16/3/25.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *likesLabel;

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _bigImageView = [[UIImageView alloc]init];
        [self addSubview:_bigImageView];
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont fontWithName:ThinFont size:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        UIImageView *likeImageView = [[UIImageView alloc]init];
        likeImageView.image = [UIImage imageNamed:@"addToFavoriteBtn"];
        [self addSubview:likeImageView];
        _likesLabel = [[UILabel alloc]init];
        _likesLabel.font = [UIFont fontWithName:ThinFont size:12];
        _likesLabel.textAlignment = NSTextAlignmentCenter;
        [_likesLabel sizeToFit];
        [self addSubview:_likesLabel];

        [_bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.trailing.equalTo(self);
            make.height.mas_equalTo(Width * 0.53);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_bigImageView.mas_bottom);
            make.leading.trailing.equalTo(self);
            make.height.mas_equalTo(30);
        }];
        [likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom);
            make.centerX.equalTo(_titleLabel).offset(-20);
            make.width.height.mas_equalTo(15);
        }];
        [_likesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(likeImageView.mas_trailing);
            make.centerY.equalTo(likeImageView);
        }];
        
    }
    return self;
}

- (void)setTopic:(HomeDataElemen *)topic {
    [self.bigImageView setImageWithURL:[NSURL URLWithString:topic.pic] placeholderImage:nil animate:YES];
    self.titleLabel.text = topic.title;
    self.likesLabel.text = topic.likes;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)height {
    [self layoutIfNeeded];
    return CGRectGetMaxY(self.likesLabel.frame) + 10;
}
@end
