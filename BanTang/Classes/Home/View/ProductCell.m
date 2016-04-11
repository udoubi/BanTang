//
//  ProductCell.m
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductCell.h"
#import "TopicDetailData.h"
#import "ProductBottonBar.h"
#import "ProductLikesView.h"
#import "ProductPicView.h"

/** 边距  */
static const CGFloat kDefaultMargin = 10;
/** cellId  */
static NSString *const cellId = @"ProductCell";

@interface ProductCell()

@property (nonatomic,strong) ProductDetail *prodoct;
@property (nonatomic,strong) NSIndexPath *indexPath;

@property (nonatomic,strong) UIImageView *goodsOrderImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *desLabel;
@property (nonatomic,strong) ProductPicView *picView;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) ProductLikesView *likesView;
@property (nonatomic,strong) ProductBottonBar *bottonBar;
@property (nonatomic,strong) UIView *seperatorView;

@end

@implementation ProductCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *seperatorView = [[UIView alloc]init];
        seperatorView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        UIImageView *goodsOrderImageView = [[UIImageView alloc]init];
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont fontWithName:LightFont size:18];
        UILabel *desLabel = [[UILabel alloc]init];
        desLabel.font = [UIFont fontWithName:ThinFont size:15];
        desLabel.preferredMaxLayoutWidth = Width - 2 * kDefaultMargin;
        desLabel.numberOfLines = 0;
        [desLabel sizeToFit];
        ProductPicView *picView = [[ProductPicView alloc]init];
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        ProductLikesView *likesView = [[ProductLikesView alloc]init];
        ProductBottonBar *bottonBar = [[ProductBottonBar alloc]init];
        
        [self.contentView addSubview:goodsOrderImageView];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:desLabel];
        [self.contentView addSubview:picView];
        [self.contentView addSubview:priceLabel];
        [self.contentView addSubview:likesView];
        [self.contentView addSubview:bottonBar];
        [self.contentView addSubview:seperatorView];
        
        [goodsOrderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(23);
            make.leading.equalTo(self.contentView).offset(kDefaultMargin);
            make.top.equalTo(self.contentView).offset(kDefaultMargin);
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(goodsOrderImageView.mas_trailing).offset(10);
            make.trailing.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(goodsOrderImageView);
            make.height.mas_equalTo(30);
        }];
        
        [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(kDefaultMargin);
            make.leading.equalTo(self.contentView).offset(10);
            make.trailing.equalTo(self.contentView).offset(-10);
        }];
        [picView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(desLabel.mas_bottom);
            make.leading.equalTo(desLabel);
            make.trailing.equalTo(desLabel);
        }];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(picView.mas_bottom);
            make.leading.equalTo(desLabel);
            make.trailing.equalTo(desLabel);
            make.height.mas_equalTo(30);
        }];

        [likesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(priceLabel.mas_bottom);
            make.leading.trailing.equalTo(self.contentView);
            make.height.mas_equalTo(70);
        }];
        [bottonBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(likesView.mas_bottom);
            make.leading.trailing.equalTo(self.contentView);
            make.height.mas_equalTo(50);
        }];
        [seperatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bottonBar.mas_bottom);
            make.leading.trailing.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(10);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.goodsOrderImageView = goodsOrderImageView;
        self.titleLabel = titleLabel;
        self.desLabel = desLabel;
        self.picView = picView;
        self.priceLabel = priceLabel;
        self.likesView = likesView;
        self.bottonBar = bottonBar;
        self.seperatorView = seperatorView;
    }
    return self;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)setProduct:(ProductDetail *)product {
    self.goodsOrderImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"good%ld",self.tag + 1]];
    self.titleLabel.text = product.title;
    self.desLabel.text = product.desc;
    self.picView.picUrlHost = self.picUrlHost;
    self.picView.images = product.pic;
    self.priceLabel.text = [NSString stringWithFormat:@"参考价:%@",product.price];
    self.likesView.userAvatrHost = self.userAvatrHost;
    self.likesView.product = product;
    self.bottonBar.product = product;
}
@end
