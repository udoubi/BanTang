//
//  CommentItemView.m
//  BanTang
//
//  Created by 江科 on 16/4/7.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "CommentItemView.h"
#import "TTTAttributedLabel.h"
#import "CommentProductView.h"
#import "UserRecomendData.h"

@interface CommentItemView()<TTTAttributedLabelDelegate>

@property (nonatomic,strong) TTTAttributedLabel *contentLabel;

@property (nonatomic,strong) CommentProductView *productView;
@property (nonatomic) BOOL hasAtUser;

@end

@implementation CommentItemView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
            }
    return self;
}
- (instancetype)initWithComment:(CommentModel *)comment {
    if (self = [super init]) {
        TTTAttributedLabel *label = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        label.font = [UIFont fontWithName:LightFont size:13];
        label.textColor = [UIColor blackColor];
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.numberOfLines = 0;
        //设置高亮颜色
        label.highlightedTextColor = [UIColor orangeColor];
        //检测url
        label.enabledTextCheckingTypes = NSTextCheckingTypeLink;
        label.delegate = self; // Delegate
        //NO 不显示下划线
        label.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:(NSString *)kCTUnderlineStyleAttributeName];
        NSString *text;
        if (comment.at_user.nickname) {
            text = [NSString stringWithFormat:@"%@：@%@ %@",comment.username,comment.at_user.nickname,comment.conent];
            self.hasAtUser = YES;
        }else{
            text = [NSString stringWithFormat:@"%@：%@",comment.username,comment.conent];
        }
        
        
        [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString)
         {
             //设置可点击文字的范围
             NSRange userRange = [[mutableAttributedString string] rangeOfString:comment.username options:NSCaseInsensitiveSearch];
             NSRange atUserRange;
             if (self.hasAtUser) {
                 atUserRange = [[mutableAttributedString string] rangeOfString:[NSString stringWithFormat:@"@%@",comment.at_user.nickname] options:NSCaseInsensitiveSearch];
             }
             
             //设定可点击文字的的大小
             UIFont *boldSystemFont = [UIFont fontWithName:LightFont size:13];
             CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
             if (font) {
                 
                 //设置可点击文本的大小
                 [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:userRange];
                 //设置可点击文本的颜色
                 [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWithRed:0.222 green:0.392 blue:1.000 alpha:1.000] CGColor] range:userRange];
                 
                 if (self.hasAtUser) {
                     
                     //设置可点击文本的大小
                     [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:atUserRange];
                    [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[[UIColor colorWithRed:0.222 green:0.392 blue:1.000 alpha:1.000] CGColor] range:atUserRange];
                 }
                 
                 CFRelease(font);
                 
             }
             return mutableAttributedString;
         }];
        label.preferredMaxLayoutWidth = Width - 20;
        [label sizeToFit];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
        }];
        CommentProductView *productView = [[CommentProductView alloc]init];
        productView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        productView.layer.masksToBounds = YES;
        [self addSubview:productView];
        
        [productView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(label.mas_bottom).offset(5);
            make.height.mas_equalTo(60);
            make.bottom.equalTo(self).offset(-5);
        }];
        productView.product = comment.product;
        if (comment.product.price == nil) {
          [productView mas_updateConstraints:^(MASConstraintMaker *make) {
              make.height.mas_equalTo(0);
          }];
        }
        
    }
    return self;
}

@end
