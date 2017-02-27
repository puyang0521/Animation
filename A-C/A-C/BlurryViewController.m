//
//  BlurryViewController.m
//  A-C
//
//  Created by puyang on 2017/2/13.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "BlurryViewController.h"

#import "GCD.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "UIFont+Fonts.h"
#import "NSString+HexColors.h"

@interface BlurryViewController ()
@property (nonatomic, strong)  UIVisualEffectView *effectView;       // 正常
@property (nonatomic, strong)  UIVisualEffectView *effectViewWhite;  // 加白
@property (nonatomic, strong)  UIVisualEffectView *effectViewBlack;  // 加黑
@end

@implementation BlurryViewController

- (void)setup {
    
    [super setup];
    
    
    self.contentView.backgroundColor = [UIColor redColor];
    
    [self addTitleViewBtn];
    
    
    
    {
    
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, Width, Width*0.36)];
        image.image        = [UIImage imageNamed:@"blurry"];
        [self.contentView addSubview:image];
        
    }
    [self show];
    
    
}

- (void)show{


//       // 移除所有子视图
//       [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
   
    
        //  创建需要的毛玻璃特效类型
    
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
        //  毛玻璃view 视图
    
        self.effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
        //添加到要有毛玻璃特效的控件中
    
        self.effectView.frame = CGRectMake(20, 100, 100, self.contentView.height-200);
    
        [self.contentView addSubview:self.effectView];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(remove)];
//    [self.effectView addGestureRecognizer:tap];
    
    //设置模糊透明度
    self.effectView.alpha = 1.0;
    
    
    {
    
        //  创建需要的毛玻璃特效类型
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        
        //  毛玻璃view 视图
        
        self.effectViewWhite = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
        //添加到要有毛玻璃特效的控件中
        
        self.effectViewWhite.frame = CGRectMake(150, 100, 100, self.contentView.height-200);
        
        [self.contentView addSubview:self.effectViewWhite];
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(remove)];
//        
//        [self.effectViewWhite addGestureRecognizer:tap];
        
        //设置模糊透明度
        self.effectViewWhite.alpha = 1.0;

    
    
    }
    
    {
    
    
        //  创建需要的毛玻璃特效类型
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        
        //  毛玻璃view 视图
        
        self.effectViewBlack = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
        //添加到要有毛玻璃特效的控件中
        
        self.effectViewBlack.frame = CGRectMake(290, 100, 100, self.contentView.height-200);
        
        [self.contentView addSubview:self.effectViewBlack];
        
        //        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(remove)];
        //
        //        [self.effectViewWhite addGestureRecognizer:tap];
        
        //设置模糊透明度
        self.effectViewWhite.alpha = 1.0;
        

    
    
    }



}


-(void)addTitleViewBtn{
    
    self.titleView.backgroundColor = [UIColor colorWithRed:204/255.0 green:232/255.0 blue:207/255.0 alpha:1];
    
    
    UIButton  *button           = [[UIButton alloc] initWithFrame:CGRectMake(Width-110, 30, 100, 25)];
    button.layer.cornerRadius   = 3.f;
    button.layer.masksToBounds  = YES;
    button.layer.borderWidth    = 0.5f;
    button.layer.borderColor    = [[UIColor grayColor] colorWithAlphaComponent:0.25f].CGColor;
    button.titleLabel.font      = [UIFont HYQiHeiWithFontSize:12];
    [button setTitle:@"透明度=0.5" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];

    [self.titleView addSubview:button];
    
}


- (void)change{

    self.effectView.alpha = 0.5;
    self.effectViewWhite.alpha  = 0.5;
    self.effectViewBlack.alpha  = 0.5;


}

@end
