//
//  GlowLabelController.m
//  A-C
//
//  Created by puyang on 2017/2/8.
//  Copyright © 2017年 puyang. All rights reserved.
//

#import "Header.h"
#import "GlowLabelController.h"
#import "GlowLabel.h"
#import "UIView+Glow.h"

@interface GlowLabelController ()

@end

@implementation GlowLabelController

- (void)setup {
    
    [super setup];

   
    self.contentView.backgroundColor = [UIColor blackColor];
    [self  show];
    

}

- (void)show{

    
    // 静态文字边辉光
    GlowLabel *glowLabel    = [[GlowLabel alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 40)];
    [self.contentView addSubview:glowLabel];
    
    glowLabel.text            = @"红红火火";
    glowLabel.textAlignment   = NSTextAlignmentCenter;
    glowLabel.backgroundColor = [UIColor clearColor];
    glowLabel.font            = [UIFont fontWithName:@"Heiti SC" size:40.f];
    glowLabel.textColor       = [[UIColor redColor] colorWithAlphaComponent:0.95f];
    
    glowLabel.glowSize       = 6;
    glowLabel.glowColor      = [UIColor cyanColor];
    
    glowLabel.innerGlowSize  = 3;
    glowLabel.innerGlowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
    
    
    
    GlowLabel *glowLabel2    = [[GlowLabel alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 40)];
    [self.contentView addSubview:glowLabel2];
    
    glowLabel2.text            = @"iOS开发 LiuChengLi";
    glowLabel2.textAlignment   = NSTextAlignmentCenter;
    glowLabel2.backgroundColor = [UIColor clearColor];
    glowLabel2.font            = [UIFont fontWithName:@"Heiti SC" size:30.f];
    glowLabel2.textColor       = [[UIColor cyanColor] colorWithAlphaComponent:0.95f];
    
    glowLabel2.glowSize       = 6;
    glowLabel2.glowColor      = [UIColor cyanColor];
    
    glowLabel2.innerGlowSize  = 3;
    glowLabel2.innerGlowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
    
    
    // 动态文字交替辉光
    
    {
    
        // name标签
        UILabel *name      = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-100, 0, 300, 200)];
        name.text          = @"浦洋";
        name.font          = [UIFont fontWithName:@"Heiti SC" size:50.f];
        name.textColor     = [UIColor redColor];
        name.center        = self.contentView.center;
        name.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:name];
        
        // 字幕标签
        UILabel *letters      = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-100, 400, 200, 200)];
        letters.text          = @"No zuo no die";
        letters.font          = [UIFont fontWithName:@"Heiti SC" size:30.f];
        letters.textColor     = [UIColor yellowColor];
        letters.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:letters];
        
        // 开始辉光
        [name startGlowingWithColor:[UIColor cyanColor]      intensity:1.0f];
        [letters startGlowingWithColor:[UIColor magentaColor] intensity:1.0f];
    
    
    
    
    }


}

@end
