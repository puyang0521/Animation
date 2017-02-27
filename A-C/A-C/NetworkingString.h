//
//  NetworkingString.h
//  A-C
//
//  Created by puyang on 2017/2/7.
//  Copyright © 2017年 puyang. All rights reserved.
//

#ifndef NetworkingString_h
#define NetworkingString_h

/**
 *  暂时没有策略交易记录
 */
static NSString *noStrategyString = @"暂时没有策略交易记录";

/**
 *  网络异常,请稍后再试
 */
static NSString *networkErrorString = @"网络异常,请稍后再试";

/**
 *  券商账户提示语
 */
static NSString *brokerageAccountString = @"您输入的券商账户不能为空";

/**
 *  券商密码提示语
 */
static NSString *brokeragePasswordString = @"您输入的券商密码不能为空";

/**
 *  券商密码不能低于6位，请重新输入
 */
static NSString *brokeragePasswordShortString = @"券商密码不能低于6位，请重新输入";

/**
 *  您输入的投资金额小于最小投资金额
 */
static NSString *lessThanLowestMoneyString = @"您输入的投资金额小于最小投资金额";

/**
 *  虚拟体验余额不足
 */
static NSString *insufficientAmountOfVirtualExperience = @"虚拟体验余额不足！";

/**
 *  虚拟体验余额不足
 */
static NSString *realInsufficientAmountOfVirtualExperience = @"您当前可用余额不足！";

/**
 *  您还没有绑定券商，请您先绑定券商！
 */
static NSString *userAccountError = @"您还没有绑定券商，请您先绑定券商！";









// 质检环境下  web静态页面地址 http://103.235.228.68:9090/xire_store/


/**
 *  虚拟投资策略介绍
 */
static NSString *investStrategy = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/page5.html";


// 真实ISM投资策略介绍

static NSString *realInvestStrategy = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/strategy_ism_true/strategy_ism_true.html";


/**
 *  投资计划攻略
 */
static NSString *investmentPlanGuide = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/strategy_siai.html";

/**
 *  绑定券商常见问题
 */

// 线下地址：http://103.235.228.69:7070/xire_store/XIRE_FILES/XiReApp/website/faq/page/faq_bind.html
// 线上地址：http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/faq/page/faq_bind.html
static NSString *bindingBrokerCommonProblems = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/faq/page/faq_bind.html";


/**
 *  IMP介绍主页
 */
static NSString *IMPInfo = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/page3_imp_introduction.html";
//// 测试
//static NSString *IMPInfo = @"http://10.0.150.5:7070/xire_store/XIRE_FILES/XiReApp/website/page3_imp_introduction.html?version=2.0.3";


/**
 *  ISM介绍主页
 */
static NSString *ISMInfo = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/page2_ism_introduction.html";
// 测试地址
//static NSString *ISMInfo = @"http://10.0.150.5:7070/xire_store/XIRE_FILES/XiReApp/website/page2_ism_introduction.html";

//老的网页@"http://192.168.10.68:8080/xire_store/XIRE_FILES/XiReApp/website/page8.html";


/**
 *  资配易介绍（你想知道的都在这里）
 */
static NSString *aboutUs = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/page10.html";

/**
 *  资配易绑定券商安全协议
 */
static NSString *BindBrokerProtocol = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/xy1.html";

/**
 *  资配易服务协议
 */
static NSString *ZPYServiceProtocol = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/xy2.html";

/**
 *  资配易投资授权协议及风险揭示
 */
static NSString *investRiskProtocol = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/xy3.html";
/**
 *  投资计划投资协议
 */
static NSString *investSIAIRiskProtocol = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/xy5.html";

/**
 *  ISM投资协议
 */
static NSString *investISMRiskProtocol = @"http://zipeiyi.com:9090/xire_store/XIRE_FILES/XiReApp/website/xy4.html";
/**
 *  主页底部滚动图第二个链接
 */
static NSString *homeBanner2 = @"http://zipeiyi.com:5050/xire-app-user-release-2.0.0/activity/chaogu.html";
//static NSString *homeBanner2 = @"http://10.0.110.33:5050/xire-app-user/activity/chaogu.html";



#endif /* NetworkingString_h */
