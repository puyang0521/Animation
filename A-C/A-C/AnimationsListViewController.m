//
//  AnimationsListViewController.m
//  Facebook-POP-Animation
//
//  Created by puyang on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "Header.h"
#import "AnimationsListViewController.h"
#import "UIView+AnimationsListViewController.h"
#import "UIView+SetRect.h"
#import "UIView+GlowView.h"
#import "UITableView+CellClass.h"
#import "ListItemCell.h"
#import "BackgroundLineView.h"
#import "DefaultNotificationCenter.h"
#import "Item.h"
#import "GCD.h"
#import "IndexRange.h"
#import "ControllerPushAnimator.h"
#import "ControllerPopAnimator.h"
#import "UIFont+Fonts.h"
#import "NotificationCenterString.h"
#import "NSString+HexColors.h"

/* 动画动效 */
#import "WarnShakeLabelController.h"
#import "GlowLabelController.h"
#import "FlowLightLabelController.h"
#import "LabelScaleViewController.h"
#import "DrawMarqueeViewController.h"
#import "MixedColorProgressViewController.h"
#import "BlurryViewController.h"
#import "LongPressButtonViewController.h"
#import "LoginButtonController.h"
#import "AlertController.h"
#import "MaskViewController.h"


/* 金融图表 */
#import "FormController.h"
#import "BrokenLineController.h"
#import "CurveLineController.h"
#import "barChartController.h"
#import "UpDownController.h"
#import "CircleChartController.h"
#import "PieChartController.h"
#import "SinglePercentController.h"


@interface AnimationsListViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate, DefaultNotificationCenterDelegate>

@property (nonatomic, strong) UISegmentedControl        *segControl;
@property (nonatomic)         NSInteger                 selectedIndex;
@property (nonatomic, strong) DefaultNotificationCenter *notificationCenter;
@property (nonatomic, strong) UITableView               *tableView;
@property (nonatomic)         BOOL                       tableViewLoadData;

@property (nonatomic, strong) NSArray  *AnimArray;
@property (nonatomic, strong) NSArray  *ChartArray;
@property (nonatomic, strong) NSMutableArray  <CellDataAdapter *> *items;

@end

@implementation AnimationsListViewController

- (void)setup {

    [super setup];
    
    [self rootViewControllerSetup];
    
    [self configNotificationCenter];
    
    [self configureDataSource];
    
    [self configureTableView];
    
    [self configureTitleView];
    
    [self creatSegmentControl];
}

#pragma mark - RootViewController setup.

- (void)rootViewControllerSetup {
    
    // [IMPORTANT] Enable the Push transitioning.
    self.navigationController.delegate = self;
    
    // [IMPORTANT] Set the RootViewController's push delegate.
    [self useInteractivePopGestureRecognizer];
}

#pragma mark - Push or Pop event.

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        
        return [ControllerPushAnimator new];
        
    } else if (operation == UINavigationControllerOperationPop) {
        
        return [ControllerPopAnimator new];
        
    } else {
        
        return nil;
    }
}

#pragma mark - configNotificationCenter

- (void)configNotificationCenter {

    self.notificationCenter          = [DefaultNotificationCenter new];
    self.notificationCenter.delegate = self;
    [self.notificationCenter addNotificationName:noti_showHomePageTableView];
}

#pragma mark - DefaultNotificationCenterDelegate

- (void)defaultNotificationCenter:(DefaultNotificationCenter *)notification name:(NSString *)name object:(id)object {
 
    if ([name isEqualToString:noti_showHomePageTableView]) {
        
        [GCDQueue executeInMainQueue:^{
                        
            // Load data.
            self.tableViewLoadData = YES;
            [self.tableView insertRowsAtIndexPaths:MakeIndexRanges(@[MakeIndexRange(0, self.items.count, 0)]) withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
}



#pragma mark - Config SegmentControl


- (void)creatSegmentControl{

    self.segControl = [[UISegmentedControl alloc] initWithItems:@[@"动画动效",@"金融图表"]];
    [self.titleView addSubview:self.segControl];
    
    self.segControl.frame                = CGRectMake(0, 0, 151*ScreenWidthRate, 30*ScreenHeightRate);
    self.segControl.center               = CGPointMake(self.titleView.centerX, self.titleView.centerY+10);
    self.segControl.tintColor            = [UIColor yellowColor];
    self.segControl.selectedSegmentIndex = 0;
    self.selectedIndex                   = 0;
    
    [self.segControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[[UIColor blackColor] colorWithAlphaComponent:0.5]} forState:UIControlStateNormal];
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[@"1E3C72" hexColor]} forState:UIControlStateSelected];


}

#pragma mark - Config TitleView.

- (void)configureTitleView {
    
    BackgroundLineView *lineView = [BackgroundLineView backgroundLineViewWithFrame:CGRectMake(0, 0, self.width, 64)
                                                                         lineWidth:4 lineGap:4
                                                                         lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.015]
                                                                            rotate:M_PI_4];
    [self.titleView addSubview:lineView];
    
    // Title label.
    UILabel *headlinelabel           = [UIView animationsListViewControllerNormalHeadLabel];
    UILabel *animationHeadLineLabel  = [UIView animationsListViewControllerHeadLabel];
    
    UILabel *headlinelabel2          = [UIView animationsListViewControllerNormalHeadLabel2];
    UILabel *animationHeadLineLabel2 = [UIView animationsListViewControllerHeadLabel2];
    
    // Title view.
    UIView *titleView              = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 64)];
    [titleView addSubview:headlinelabel];
    [titleView addSubview:animationHeadLineLabel];
    [titleView addSubview:headlinelabel2];
    [titleView addSubview:animationHeadLineLabel2];
    [self.titleView addSubview:titleView];
    
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, self.width, 0.5f)];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [titleView addSubview:line];
    
    // Start glow.
    animationHeadLineLabel.glowRadius            = @(2.f);
    animationHeadLineLabel.glowOpacity           = @(1.f);
    animationHeadLineLabel.glowColor             = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    
    animationHeadLineLabel.glowDuration          = @(1.f);
    animationHeadLineLabel.hideDuration          = @(3.f);
    animationHeadLineLabel.glowAnimationDuration = @(2.f);
    
    [animationHeadLineLabel createGlowLayer];
    [animationHeadLineLabel insertGlowLayer];
    
    animationHeadLineLabel2.glowRadius            = @(2.f);
    animationHeadLineLabel2.glowOpacity           = @(1.f);
    animationHeadLineLabel2.glowColor             = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    
    animationHeadLineLabel2.glowDuration          = @(1.f);
    animationHeadLineLabel2.hideDuration          = @(3.f);
    animationHeadLineLabel2.glowAnimationDuration = @(2.f);
    
    [animationHeadLineLabel2 createGlowLayer];
    [animationHeadLineLabel2 insertGlowLayer];
    
    [GCDQueue executeInMainQueue:^{
        
        [animationHeadLineLabel startGlowLoop];
        [animationHeadLineLabel2 startGlowLoop];
        
    } afterDelaySecs:1.f];
}

#pragma mark - Config DataSource.

- (void)configureDataSource {
    
    // 动画数据
    self.AnimArray = @[[Item itemWithName:@"晃动警告文字" object:[WarnShakeLabelController class]],
                       [Item itemWithName:@"辉光文字" object:[GlowLabelController class]],
                       [Item itemWithName:@"闪亮文字" object:[FlowLightLabelController class]],
                       [Item itemWithName:@"复合缩放文字" object:[LabelScaleViewController class]],
                       [Item itemWithName:@"跑马灯文字" object:[DrawMarqueeViewController class]],
                       [Item itemWithName:@"底色混色文字" object:[MixedColorProgressViewController class]],
                       [Item itemWithName:@"长按按钮" object:[LongPressButtonViewController class]],
                       [Item itemWithName:@"登录校验按钮" object:[LoginButtonController class]],
                       [Item itemWithName:@"view模糊" object:[BlurryViewController class]],
                       [Item itemWithName:@"弹窗" object:[AlertController class]],
                       [Item itemWithName:@"蒙版引导" object:[MaskViewController class]]
                       
                       ];
    
    
    
    // 图表数据
    self.ChartArray = @[[Item itemWithName:@"表格" object:[FormController class]],
                        [Item itemWithName:@"折线图" object:[BrokenLineController class]],
                        [Item itemWithName:@"曲线图" object:[CurveLineController class]],
                        [Item itemWithName:@"单一柱状图图" object:[barChartController class]],
                        [Item itemWithName:@"上下柱状图" object:[UpDownController class]],
                        [Item itemWithName:@"环状饼图" object:[CircleChartController class]],
                        [Item itemWithName:@"实心饼图" object:[PieChartController class]],
                        [Item itemWithName:@"单一百分比图" object:[SinglePercentController class]]
                  
                        ];
    
    
    
    self.items = [NSMutableArray array];
    
    for (int i = 0; i < self.AnimArray.count; i++) {
    
        Item *item = self.AnimArray[i];
        item.index = i + 1;
        [item createAttributedString];

        [self.items addObject:[ListItemCell dataAdapterWithCellReuseIdentifier:nil data:item cellHeight:0 type:0]];
    }
}

#pragma mark - TableView Related.

- (void)configureTableView {
    
    self.tableView                = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.rowHeight      = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerCellsClass:@[cellClass(@"ListItemCell", nil)]];
    [self.contentView addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tableViewLoadData ? self.items.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView dequeueAndLoadContentReusableCellFromAdapter:_items[indexPath.row] indexPath:indexPath controller:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [(CustomCell *)[tableView cellForRowAtIndexPath:indexPath] selectedEvent];    
}


#pragma mark - 分割器响应事件
- (void)segmentAction:(UISegmentedControl*)sender{
    
     NSInteger index = sender.selectedSegmentIndex;
    
    if (self.selectedIndex != index) {
        
        self.selectedIndex = index;
        
        self.segControl.selectedSegmentIndex = index;
        
        
        
        
        [self.items removeAllObjects];
        
        
        if (index ==0) {
            
            for (int i = 0; i < self.AnimArray.count; i++) {
                
                Item *item = self.AnimArray[i];
                item.index = i + 1;
                [item createAttributedString];
                
                [self.items addObject:[ListItemCell dataAdapterWithCellReuseIdentifier:nil data:item cellHeight:0 type:0]];
            }

        }
        
        
        
        
        if (index == 1) {
            
            for (int i = 0; i < self.ChartArray.count; i++) {
                
                Item *item = self.ChartArray[i];
                item.index = i + 1;
                [item createAttributedString];
                
                [self.items addObject:[ListItemCell dataAdapterWithCellReuseIdentifier:nil data:item cellHeight:0 type:0]];
            }
            
        }
        
        [self.tableView reloadData];
    }

    


}

#pragma mark - Overwrite system methods.

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.enableInteractivePopGestureRecognizer = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
//    self.enableInteractivePopGestureRecognizer = YES;
}

@end
