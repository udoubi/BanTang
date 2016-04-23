//
//  UserRecomendCell.m
//  BanTang
//
//  Created by 江科 on 16/4/6.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "UserRecomendCell.h"
#import "ProductToolBar.h"
#import "ProductTagView.h"
#import "RelateProductView.h"
#import "CommentListView.h"
#import "CommentView.h"

@interface UserRecomendCell()
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UIImageView *gradeImageView;
@property (nonatomic,strong) UIImageView *goodsImageView;
@property (nonatomic,strong) UIImageView *likeImageView;

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *desLabel;
@property (nonatomic,strong) UILabel *likeLabel;
@property (nonatomic,strong) UILabel *commentLabel;

@property (nonatomic,strong) ProductToolBar *toolBar;
@property (nonatomic,strong) ProductTagView *tagView;
@property (nonatomic,strong) RelateProductView *relateProductView;
@property (nonatomic,strong) CommentListView *commentListView;
@property (nonatomic,strong) CommentView *commentView;


@end

@implementation UserRecomendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconImageView = [[UIImageView alloc]init];
        iconImageView.layer.cornerRadius = 12.5;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = [UIFont fontWithName:LightFont size:13];
        [nameLabel sizeToFit];
        
        UIImageView *gradeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_group_recommend"]];
        
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.font = [UIFont fontWithName:ThinFont size:11];
        timeLabel.textColor = [UIColor lightGrayColor];
        [timeLabel sizeToFit];
        
        UIImageView *goodsImageView = [[UIImageView alloc]init];
        
        ProductToolBar *toolBar = [[ProductToolBar alloc]init];
        
        ProductTagView *tagView = [[ProductTagView alloc]init];
        
        UILabel *desLabel = [[UILabel alloc]init];
        desLabel.font = [UIFont fontWithName:LightFont size:13];
        desLabel.preferredMaxLayoutWidth = Width - 20;
        desLabel.numberOfLines = 0;
        
        UILabel *relateLabel = [[UILabel alloc]init];
        relateLabel.text = @"相关链接";
        relateLabel.font = [UIFont fontWithName:ThinFont size:12];
        relateLabel.textColor = [UIColor darkGrayColor];
        
        RelateProductView *relateProductView = [[RelateProductView alloc]init];
        relateProductView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0  blue:239/255.0  alpha:1.0];
        
        UIImageView *likeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"addToFavorite_selected"]];
        UILabel *likeLabel = [[UILabel alloc]init];
        likeLabel.font = [UIFont fontWithName:ThinFont size:12];
        likeLabel.textColor = [UIColor darkGrayColor];
        
        UILabel *commentLabel = [[UILabel alloc]init];
        commentLabel.font = [UIFont fontWithName:ThinFont size:12];
        commentLabel.textColor = [UIColor darkGrayColor];
        
        CommentListView *commentListView = [[CommentListView alloc]init];
        
        CommentView *commentView = [[CommentView alloc]init];
        
        UIView *seperatorView = [[UIView alloc]init];
        seperatorView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        [self.contentView addSubview:iconImageView];
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:gradeImageView];
        [self.contentView addSubview:timeLabel];
        [self.contentView addSubview:goodsImageView];
        [self.contentView addSubview:toolBar];
        [self.contentView addSubview:tagView];
        [self.contentView addSubview:desLabel];
        [self.contentView addSubview:relateLabel];
        [self.contentView addSubview:relateProductView];
        [self.contentView addSubview:likeImageView];
        [self.contentView addSubview:likeLabel];
        [self.contentView addSubview:commentLabel];
        [self.contentView addSubview:commentListView];
        [self.contentView addSubview:commentView];
        [self.contentView addSubview:seperatorView];
        
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView).offset(10);
            make.top.equalTo(self.contentView).offset(10);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(iconImageView.mas_trailing).offset(10);
            make.centerY.equalTo(iconImageView);
        }];
        [gradeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(nameLabel.mas_trailing).offset(15);
            make.centerY.equalTo(iconImageView);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(iconImageView);
        }];
        
        [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.mas_bottom).offset(10);
            make.leading.trailing.equalTo(self.contentView);
            make.height.mas_equalTo(Width);
        }];
        
        [toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self.contentView);
            make.top.equalTo(goodsImageView.mas_bottom);
            make.height.mas_equalTo(44);
        }];
        [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self.contentView);
            make.top.equalTo(toolBar.mas_bottom);
        }];
        [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView).offset(10);
            make.trailing.equalTo(self.contentView).offset(-10);
            make.top.equalTo(tagView.mas_bottom).offset(10);
        }];
        [relateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.height.mas_equalTo(20);
            make.top.equalTo(desLabel.mas_bottom).offset(10);
            make.trailing.equalTo(self);
        }];
        [relateProductView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView).offset(10);
            make.trailing.equalTo(self.contentView).offset(-10);
            make.top.equalTo(relateLabel.mas_bottom).offset(2);
            make.height.mas_equalTo(60);
        }];
        [likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView).offset(10);
            make.top.equalTo(relateProductView.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            
        }];
        [likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(likeImageView.mas_trailing).offset(10);
            make.trailing.equalTo(self.contentView).offset(-10);
            make.height.mas_equalTo(20);
            make.centerY.equalTo(likeImageView);
        }];
        [commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.contentView).offset(10);
            make.trailing.equalTo(self);
            make.top.equalTo(likeLabel.mas_bottom);
            make.height.mas_equalTo(20);
        }];
        [commentListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(commentLabel.mas_bottom).offset(10);
            make.leading.equalTo(self.contentView).offset(10);
            make.trailing.equalTo(self.contentView).offset(-10);
        }];
        [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(commentListView.mas_bottom).offset(10);
            make.leading.equalTo(self.contentView);
            make.trailing.equalTo(self.contentView);
            make.height.mas_equalTo(30);
        }];
        [seperatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(commentView.mas_bottom).offset(10);
            make.leading.trailing.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(10);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.iconImageView = iconImageView;
        self.nameLabel = nameLabel;
        self.gradeImageView = gradeImageView;
        self.timeLabel = timeLabel;
        self.goodsImageView = goodsImageView;
        self.toolBar = toolBar;
        self.tagView = tagView;
        self.desLabel = desLabel;
        self.relateProductView = relateProductView;
        self.likeImageView = likeImageView;
        self.likeLabel = likeLabel;
        self.commentLabel = commentLabel;
        self.commentListView = commentListView;
        self.commentView = commentView;
        
    }
    return self;
}

- (void)setRecomend:(UserRecomend *)recomend {
    [self.iconImageView setImageWithURL:[NSURL URLWithString:recomend.author.avatar] placeholderImage:[UIImage imageNamed:@"HeaderPlaceHolder"] animate:YES];
    self.nameLabel.text = recomend.author.nickname;
    self.timeLabel.text = recomend.datestr;
    [self.goodsImageView setImageWithURL:[NSURL URLWithString:recomend.pics[0].url] placeholderImage:nil animate:YES];
    self.tagView.tags = recomend.tags;
    self.desLabel.text = recomend.content;
    self.relateProductView.product = recomend.product[0];
    self.likeLabel.text = [NSString stringWithFormat:@"%@人喜欢",recomend.dynamic.likes];
    self.commentLabel.text = [recomend.dynamic.comments isEqualToString:@"0"] ? @"评论" : [NSString stringWithFormat:@"所有%@条评论",recomend.dynamic.comments];
    self.commentListView.comments = recomend.comments;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    UserRecomendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UserRecomendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    return cell;
}
@end
