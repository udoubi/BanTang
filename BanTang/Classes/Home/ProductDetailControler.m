//
//  ProductDetailControlerViewController.m
//  BanTang
//
//  Created by 天空之城 on 16/4/1.
//  Copyright © 2016年 天空之城. All rights reserved.
//

#import "ProductDetailControler.h"
#import "TopicDetailData.h"
#import "ProductCell.h"
#import "UINavigationBar+Extension.h"
#import "TitleScrollView.h"
#import "UIBarButtonItem+Extension.h"
#import "TopicDesView.h"
#import "UserRecomendData.h"
#import "UserRecomendCell.h"
#import "HomePopTransitionAnimator.h"
#import "LoadingView.h"

/** 顶部图片的高度  */
#define kTopImageViewHeight  0.55 * Width
/** cellId  */
static NSString *const cellId = @"ProductCell";
@interface ProductDetailControler ()<UITableViewDataSource,UITableViewDelegate,TitleScrollViewDelegate>
@property (nonatomic,strong) TitleScrollView *titleView;
@property (nonatomic,strong) HomeTopicModel *topic;
@property (nonatomic,strong) NSArray<UserRecomend *> *userRecomendList;
@property (nonatomic,assign) BOOL isUserRecomend;

/** navigationBar的alpha值 */
@property (nonatomic, assign) CGFloat navigationBarAlpha;

@end

@implementation ProductDetailControler

#pragma life cycle method
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.delegate = self;
    [self buildNavigationBar];
    [self buildTopImageView];
    [self loadTopicData];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
    [self.navigationController.navigationBar zz_setTitleViewAlpha:self.navigationBarAlpha];
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar zz_reset];
}
- (TitleScrollView *)titleView {
    if (_titleView == nil) {
        _titleView = [[TitleScrollView alloc]initWithTitleArray:@[@"半糖精选",@"用户推荐"] itemWidth:Width * 0.5];
        _titleView.delegate = self;
        _titleView.frame = CGRectMake(0, 0, Width, 44);
    }
    return _titleView;
}

#pragma build view
- (void)buildNavigationBar {
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *favItem = [UIBarButtonItem barBtnItemWithNmlImg:@"goodsDetail_fav_un" hltImg:@"goodsDetail_fav_un" target:self action:@selector(favButtonCliked)];
    UIBarButtonItem *shareItem = [UIBarButtonItem barBtnItemWithNmlImg:@"goodsDetail_share" hltImg:@"goodsDetail_share" target:self action:@selector(shareButtonCliked)];
    self.navigationItem.rightBarButtonItems = @[shareItem,favItem];
    UILabel *label = [[UILabel alloc]init];
    label.text = @"购物清单";
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    self.navigationItem.titleView = label;
}
- (void)loadTopicData {
    
    
    LoadingView *loadingView = [[LoadingView alloc]init];
    [self.view addSubview:loadingView];
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.equalTo(self.view);
    }];
    [loadingView startAnimating];
    [TopicDetailData loadTopicData:^(id data, NSError *error) {
        self.topic = data;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [loadingView stopAnimating];
             [self buildTableView];
            // 先刷新布局
            [self.tableView layoutIfNeeded];
            
            [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view).offset(64);
            }];
            [self.tableView setNeedsLayout];
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.tableView layoutIfNeeded];
            } completion:^(BOOL finished) {
                
            }];
        });
        
       
    }];
    [UserRecomendData loadUserRecomendData:^(id data, NSError *error) {
        self.userRecomendList = data;
    }];
}
- (void)buildTopImageView {
    self.topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, kTopImageViewHeight)];
    [self.view addSubview:self.topImageView];
}
- (void)buildTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = self.isUserRecomend ? 1000 : 800;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64 + 500);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    
    // build tableHeaderView
    UIView *headerView = [[UIView alloc]init];
    UIView *clearView = [[UIView alloc]init];
    clearView.backgroundColor = [UIColor clearColor];
    clearView.frame = CGRectMake(0, 0, Width, kTopImageViewHeight - 64);
    [headerView addSubview:clearView];
    TopicDesView *topicDesView = [[TopicDesView alloc]init];
    topicDesView.backgroundColor = [UIColor whiteColor];
    CGFloat topicDesViewH = [topicDesView viewHeight:self.topic];
    topicDesView.frame = CGRectMake(0, kTopImageViewHeight - 64 , Width , topicDesViewH);
    [headerView addSubview:topicDesView];
    headerView.frame = CGRectMake(0, 0, Width, kTopImageViewHeight - 64 + topicDesViewH);
    
    self.tableView.tableHeaderView = headerView;
}

#pragma tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isUserRecomend) {
        return self.userRecomendList.count;
    }
    return self.topic.product.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isUserRecomend) {
        UserRecomendCell *cell = [UserRecomendCell cellWithTableView:tableView];
        cell.recomend = self.userRecomendList[indexPath.row];
        return cell;
    }
    ProductCell *cell = [ProductCell cellWithTableView:tableView];
    cell.picUrlHost = self.topic.product_pic_host;
    cell.userAvatrHost = self.topic.user_avatr_host;
    cell.tag = indexPath.row;
    cell.product = self.topic.product[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return self.titleView;
}

#pragma scrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    

    CGFloat alpha = scrollView.contentOffset.y / 250;
    self.navigationBarAlpha = MIN(1, alpha);
    [self.navigationController.navigationBar zz_setBackgroundColor:[[UIColor getColor:CustomBarTintColor] colorWithAlphaComponent:self.navigationBarAlpha]];
    [self.navigationController.navigationBar zz_setTitleViewAlpha:self.navigationBarAlpha];
    
    if (scrollView.contentOffset.y < 0) {
        CGFloat bigImageH =  kTopImageViewHeight + fabs(scrollView.contentOffset.y);
        CGFloat scale = bigImageH / (kTopImageViewHeight);
        self.topImageView.frame = CGRectMake(-(Width * scale - Width) * 0.5, 0, Width * scale, bigImageH);
    }else{
        self.topImageView.frame = CGRectMake(0, -scrollView.contentOffset.y, CGRectGetWidth(self.topImageView.frame), CGRectGetHeight(self.topImageView.frame));
    }
}

- (void)didTitleScrollViewCliked:(TitleScrollView *)titleScrollView atIndex:(NSInteger)index {
    self.isUserRecomend = (index == 1);
    NSIndexSet * nd=[[NSIndexSet alloc]initWithIndex:0];//刷新第二个section
    [self.tableView reloadSections:nd withRowAnimation:UITableViewRowAnimationFade];
}
#pragma callback

- (void)favButtonCliked {}
- (void)shareButtonCliked {}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPop) {
        return [HomePopTransitionAnimator new];
    }
    return nil;
}
@end
