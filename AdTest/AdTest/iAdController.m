//
//  iAdController.m
//  Test
//
//  Created by lyywhg on 13-1-30.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "iAdController.h"

@interface iAdController ()

@end

@implementation iAdController

- (void)dealloc
{
    [_iAdV release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.iAdV.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ADBannerView *)iAdV
{
    if (!_iAdV)
    {
        _iAdV = [[ADBannerView alloc]initWithFrame:CGRectMake(0.0, 300.0, self.view.frame.size.width, 50.0)];
        //此Banner所能支援的类型
        _iAdV.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, ADBannerContentSizeIdentifierLandscape, nil];
        //目前的Banner 类型
        _iAdV.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        //设定代理
        _iAdV.delegate = self;
        //无法按下触发广告
        _iAdV.userInteractionEnabled = NO;
        //设定偏位移量
        _iAdV.frame = CGRectOffset(_iAdV.frame, 0, 50);
        [self.view addSubview:_iAdV];
    }
    return _iAdV;
}

// 广告读取过程中出现错误
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError * )error
{
// 切换ADBannerView表示状态，显示→隐藏
    // adView.frame = CGRectOffset(adView.frame, 0, self.view.frame.size.height);
}
// 成功读取广告
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
// 切换ADBannerView表示状态，隐藏→显示
    // adView.frame = CGRectOffset(adView.frame, 0, self.view.frame.size.height - adView.frame.size.height);
}
// 用户点击广告是响应，返回值BOOL指定广告是否打开
// 参数willLeaveApplication是指是否用其他的程序打开该广告
// 一般在该函数内让当前View停止，以及准备全画面表示广告
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"bannerViewActionShouldBegin:willLeaveApplication: is called.");
    return NO;
}
// 全画面的广告表示完了后，调用该接口
// 该接口被调用之后，当前程序一般会作为后台程序运行
// 该接口中需要回复之前被中断的处理（如果有的话）
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    NSLog(@"bannerViewActionDidFinish: is called.");
}

@end
