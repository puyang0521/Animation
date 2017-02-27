//
//  LoadMaskHelper.m
//  ZiPeiYi
//
//  Created by puyang on 16/11/14.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "LoadMaskHelper.h"
#import "UIView+SetRect.h"
#import "WxHxD.h"
#import "SingleMaskView.h"
#import "GCD.h"


#define MaskVersiomKey       @"MaskVersiomKey"

#define HomePageKey          @"HomePage2.3.5"          // 主页 可用资产
#define RealIncomeKey        @"RealIncome2.3.5"        // ISM完成期详情 实际收益
#define StockTimesharingKey  @"StockTimesharing2.3.5"  // 股票分时图 



@implementation LoadMaskHelper

+ (void)showMaskWithType:(PageTye)pageType onView:(UIView*)view delay:(NSTimeInterval)delay{
    
    
    // 处理是否加载蒙版
    switch (pageType) {
            
            // 个人主页
        case HomePage:
        {
            NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:HomePageKey];
            if(KeyStr.length <=0)
            {
            
                [[NSUserDefaults standardUserDefaults] setObject:@"haveShown" forKey:HomePageKey];
            
            }else{
                
//                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:HomePageKey];
                return;
            
            }
        
        }
           
        break;
            
            
        
            
            
        case StockTimesharing:
        {
            NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:StockTimesharingKey];
            if(KeyStr.length <=0)
            {
                
                [[NSUserDefaults standardUserDefaults] setObject:@"haveShown" forKey:StockTimesharingKey];
                
            }else{
//                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:StockTimesharingKey];
                return;
                
            }
            
        }
            
            break;
            
        default:
          break;
    }

    
    
    
    
    
    
    
    
    
    SingleMaskView *maskView = [SingleMaskView new];
    
    // 加载什么样的蒙版
    switch (pageType) {
        
          // 主页
        case HomePage:
        {
            CGFloat heightBit = 0;
            if (iPhone == iPhone4_4s)
            {
                heightBit = 7;
                
            }
           
            [maskView addTransparentRect:CGRectMake(view.width-180*ScreenWidthRate, 205*ScreenHeightRate+heightBit, 170*ScreenWidthRate+heightBit-2, 50*ScreenHeightRate) withRadius:10*ScreenWidthRate];
            [maskView addImage:[UIImage imageNamed:@"首页引导"] withFrame:CGRectMake(view.width-220*ScreenWidthRate, 270*ScreenHeightRate+heightBit, 210*ScreenWidthRate, 83*ScreenWidthRate)];
        }
            break;
       
            
            
            
            
        // 曲线分时
        case StockTimesharing:
        {
            CGFloat heightBit = 0;
            if (iPhone == iPhone6_7plus)
            {
                heightBit = 7;
                
            }else if (iPhone == iPhone5_5s){
                
                heightBit = -7;
            }else if (iPhone == iPhone4_4s){
                heightBit = -15;
            }
            [maskView addTransparentRect:CGRectMake(view.width/6, 250*ScreenHeightRate-heightBit, 60*ScreenWidthRate, 30*ScreenHeightRate) withRadius:8*ScreenWidthRate];
            [maskView addImage:[UIImage imageNamed:@"分时引导"] withFrame:CGRectMake(-30, 300*ScreenHeightRate-heightBit, 267*ScreenWidthRate , 83*ScreenWidthRate)];
        }
            break;

            
            
        default:
            break;
    }
    
    
    [GCDQueue executeInMainQueue:^{
        
         [maskView showMaskViewInView:view];
    
    } afterDelaySecs:delay];
    
   


}

+ (void)checkAPPVersion{

//    // 启动时候检测，版本升级
//    NSString *KeyStr = [[NSUserDefaults standardUserDefaults] objectForKey:MaskVersiomKey];
//    if (KeyStr.length <=0) {
//        
//        // 头一次安装
//        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//        [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:MaskVersiomKey];
//        
//        return;
//    }else{
//        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//        
//        if ([KeyStr isEqualToString:appVersion])
//        {
//            return;
//            
//        }else{
//            // 版本升级的情况
//            [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:MaskVersiomKey];
//            
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:HomePageKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtSIAIKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtISMKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtSIAIKeyListKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:VtISMKeyListKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:SIAIInstructionKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:ISMInstructionKey];
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:StockCurveKey];
//            
//        }
//        
//    }
    


}
@end
