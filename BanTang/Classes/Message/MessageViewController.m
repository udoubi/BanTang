//
//  MessageViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/3/24.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "MessageViewController.h"
#import "TTTAttributedLabel.h"
#import "UserRecomendData.h"
#import "ProductTagView.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
//    [UserRecomendData loadUserRecomendData:^(id data, NSError *error) {
//        
//    }];
//    
//    ProductTagView *view = [[ProductTagView alloc]initWithTags:@[@"呵呵",@"阿卡看看",@"阿萨撒",@"是撒撒娇撒就",@"是撒撒娇撒就",@"是撒撒娇撒就",@"是撒撒娇撒就"]];
////    view.frame = CGRectMake(0, 20, Width,60);
//    [self.view addSubview:view];
//    
    
//    // Do any additional setup after loading the view.
//    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
//    label.font = [UIFont systemFontOfSize:14];
//    label.textColor = [UIColor darkGrayColor];
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//    label.numberOfLines = 0;
//    
//    // If you're using a simple `NSString` for your text,
//    // assign to the `text` property last so it can inherit other label properties.
//    NSString *text = @"Lorem ipsum dolor sit amet";
//    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
//        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"ipsum dolor" options:NSCaseInsensitiveSearch];
//        NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"sit amet" options:NSCaseInsensitiveSearch];
//        
//        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
//        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
//        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
//        if (font) {
//            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
//            [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:@YES range:strikeRange];
//            CFRelease(font);
//        }
//        
//        return mutableAttributedString;
//    }];
//    [label sizeToFit];
//    label.frame = CGRectMake(0, 20, label.frame.size.width, label.frame.size.height);
////    [self.view addSubview:label];
//    
//    
//    
//    TTTAttributedLabel *attributedLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
//    
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Tom Bombadil"
//                                                                    attributes:@{
//                                                                                 (id)kCTForegroundColorAttributeName : (id)[UIColor redColor].CGColor,
//                                                                                 NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
//                                                                                 NSKernAttributeName : [NSNull null],
//                                                                                 (id)kTTTBackgroundFillColorAttributeName : (id)[UIColor greenColor].CGColor
//                                                                                 }];
//    
//    // The attributed string is directly set, without inheriting any other text
//    // properties of the label.
//    attributedLabel.text = attString;
//    [label sizeToFit];
//    label.frame = CGRectMake(0, 20, label.frame.size.width, label.frame.size.height);
//    [self.view addSubview:attributedLabel];
    
    
    
//    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
//    
//    label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
////    label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
//    
//    label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
//    
//    NSRange range = [label.text rangeOfString:@"me"];
//    [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range];
//    
//    [label sizeToFit];
//    label.frame = CGRectMake(0, 20, label.frame.size.width, label.frame.size.height);
//    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
