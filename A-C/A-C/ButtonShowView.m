//
//  ButtonShowView.m
//  A-C
//
//  Created by puyang on 2017/2/14.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "ButtonShowView.h"

#import "UIFont+Fonts.h"
#import "UIView+SetRect.h"
#import "POP.h"
#import "NSString+HexColors.h"

@interface ButtonShowView ()

@property (nonatomic, strong)  UIView  *blackView;
@property (nonatomic, strong)  UIView  *messageView;

@property (nonatomic, strong)  UIButton  *firstButton;
@property (nonatomic, strong)  UIButton  *secondButton;

@end


@implementation ButtonShowView
- (instancetype)init {
    
    if (self) {
        
        self = [super init];
    
      
        
        
    }
    
    return self;
}


- (void)showButtonViewOn:(UIView*)contentView{
    
    
    
    if (contentView) {
        
        [contentView addSubview:self];
        [self createBlackView:contentView];
        [self createMessageView:contentView];
        
    }
}


- (void)createBlackView:(UIView*)contentView {
    
    self.blackView                 = [[UIView alloc] initWithFrame:contentView.bounds];
    self.blackView.backgroundColor = [UIColor blackColor];
    self.blackView.alpha           = 0;
    [self addSubview:self.blackView];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.blackView.alpha = 0.25f;
    }];
}

- (void)createMessageView:(UIView*)contentView {
    
    
    // 创建信息label
    NSString *text            = self.message;
    UILabel *textLabel        = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 0)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text            = text;
    textLabel.font            = [UIFont HeitiSCWithFontSize:15.f];
    textLabel.textColor       = [UIColor blackColor];
    textLabel.textAlignment   = NSTextAlignmentCenter;
    textLabel.numberOfLines   = 0;
    [textLabel sizeToFit];
    
    
    //模糊
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectViewWhite = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectViewWhite.frame = CGRectMake(0, 0, 280, textLabel.height+50 );
    effectViewWhite.alpha = 0.8;


    
    // 创建信息窗体view
    self.messageView                    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, textLabel.height + 100)];
    self.messageView.layer.cornerRadius = 10.f;
    self.messageView.clipsToBounds      = YES;
    self.messageView.center             = contentView.middlePoint;
    textLabel.center                    = CGPointMake(self.messageView.middleX, 0);
    textLabel.top                       = 30;
    self.messageView.alpha              = 1.f;
    [self.messageView addSubview:effectViewWhite];
    [self.messageView addSubview:textLabel];
    [self addSubview:self.messageView];
    
    

    
    
 
    // 如果有1个按钮
    if (self.buttonsTitleArray.count == 1) {
        
        
        // 添加一个模糊效果
        UIVisualEffectView *effectViewWhite2 = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        effectViewWhite2.frame = CGRectMake(0, self.messageView.height-48, self.messageView.width, self.messageView.height -48);
        effectViewWhite2.alpha = 0.8;
        [self.messageView addSubview:effectViewWhite2];
        
        UIColor *firstColor = [UIColor blackColor];
        if (self.buttonsColorArray[0]) {
            firstColor = self.buttonsColorArray[0];
        }
        
        self.firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.firstButton.frame = CGRectMake(0, self.messageView.height - 48, self.messageView.width, 48);
        self.firstButton.tag                    = 10;
        self.firstButton.enabled                = NO;
        self.firstButton.backgroundColor        = [UIColor clearColor];
        self.firstButton.titleLabel.font        = [UIFont HYQiHeiWithFontSize:16.f];
        [self.firstButton setTitle:self.buttonsTitleArray[0] forState:UIControlStateNormal];
        [self.firstButton setTitleColor:firstColor forState:UIControlStateNormal];
        [self.firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.firstButton addTarget:self action:@selector(messageButtonsEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.messageView addSubview:self.firstButton];
    }
    
    // 如果有2个按钮
    if (self.buttonsTitleArray.count == 2) {
        
        
        // 添加左右模糊效果
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *effectViewWhiteLeft = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        effectViewWhiteLeft.frame = CGRectMake(0, self.messageView.height -48, self.messageView.width/2-0.5, 48);
        effectViewWhiteLeft.alpha = 0.8;
        [self.messageView addSubview:effectViewWhiteLeft];
        
        UIVisualEffectView *effectViewWhiteRight = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        effectViewWhiteRight.frame = CGRectMake(self.messageView.width/2+0.5, self.messageView.height -48, self.messageView.width/2, 48);
        effectViewWhiteRight.alpha = 0.8;
        [self.messageView addSubview:effectViewWhiteRight];
       
        
        
        
        UIColor *firstColor = [UIColor blackColor];
        if (self.buttonsColorArray[0]) {
            firstColor = self.buttonsColorArray[0];
        }
        
        UIColor *secondColor = [UIColor redColor];
        if (self.buttonsColorArray[1]) {
            secondColor = self.buttonsColorArray[1];
        }

        self.firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.firstButton.frame = CGRectMake(0, self.messageView.height - 48, self.messageView.width/2-0.5, 48);
        self.firstButton.tag                    = 10;
        self.firstButton.enabled                = NO;
        self.firstButton.titleLabel.font        = [UIFont HYQiHeiWithFontSize:16.f];
        [self.firstButton setTitle:self.buttonsTitleArray[0] forState:UIControlStateNormal];
        [self.firstButton setTitleColor:firstColor forState:UIControlStateNormal];
        [self.firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.firstButton addTarget:self action:@selector(messageButtonsEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.messageView addSubview:self.firstButton];
        
        self.secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.secondButton.frame = CGRectMake(self.messageView.width/2-0.5, self.messageView.height - 48, self.messageView.width/2-0.5, 48);
        self.secondButton.tag                    = 11;
        self.secondButton.enabled                = NO;
        self.secondButton.titleLabel.font        = [UIFont HYQiHeiWithFontSize:16.f];
        [self.secondButton setTitle:self.buttonsTitleArray[1] forState:UIControlStateNormal];
        [self.secondButton setTitleColor:secondColor  forState:UIControlStateNormal];
        [self.secondButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self.secondButton addTarget:self action:@selector(messageButtonsEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.messageView addSubview:self.secondButton];
    }
    
//        // 执行动画  过多的透明度设置，易闪烁
//        POPBasicAnimation  *alpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//        alpha.toValue             = @(1.f);
//        alpha.duration            = 0.3f;
//        [self.messageView pop_addAnimation:alpha forKey:nil];
    
        POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scale.fromValue           = [NSValue valueWithCGSize:CGSizeMake(1.75f, 1.75f)];
        scale.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
        scale.dynamicsTension     = 1000;
        scale.dynamicsMass        = 1.3;
        scale.dynamicsFriction    = 10.3;
        scale.springSpeed         = 20;
        scale.springBounciness    = 15.64;
        scale.delegate            = self;
        [self.messageView.layer pop_addAnimation:scale forKey:nil];
    
   
    
    

}

- (void)removeViews {
    
    [UIView animateWithDuration:0.2f animations:^{
        
        self.blackView.alpha       = 0.f;
        self.messageView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);

        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)messageButtonsEvent:(UIButton *)button {
 
    
    
    if (button.tag == 10 && self.eventBlock) {
        
        self.eventBlock(0);
    }
   
    if (button.tag == 11 && self.eventBlock) {
        
        self.eventBlock(1);
    }
    
    [self removeViews];
    
}

// 防止刚弹出就立马点击按钮事件，导致弹窗缩小消失异常
- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished {
    
       self.firstButton.enabled    = YES;
       self.secondButton.enabled   = YES;
}

@end
