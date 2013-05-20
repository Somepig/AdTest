//
//  DomobViewController.m
//  Test
//
//  Created by lyywhg on 13-5-20.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "DomobController.h"

@implementation DomobController

- (DMAdView *)dmAdView
{
    if (!_dmAdView)
    {
        // 创建广告视图，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
        _dmAdView = [[DMAdView alloc] initWithPublisherId:DomobID placementId:DomobPublicId size:DOMOB_AD_SIZE_320x50];
        // 设置广告视图的位置
        _dmAdView.frame = CGRectMake(0, 230, DOMOB_AD_SIZE_320x50.width, DOMOB_AD_SIZE_320x50.height);
        _dmAdView.delegate = self; // 设置 Delegate
        _dmAdView.rootViewController = self;
        [self.view addSubview:_dmAdView]; // 将广告视图添加到父视图中
        // 开始加载广告}
    }
    return _dmAdView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.dmAdView loadAd];//Domob广告
    [self.view bringSubviewToFront:self.dmAdView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_Interstitial release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setInterstitial:nil];
    [super viewDidUnload];
}

- (IBAction)bannerShow
{
    DMInlineViewController *tBannerVC = [[DMInlineViewController alloc] init];
    [self.navigationController pushViewController:tBannerVC animated:YES];
    [tBannerVC release];
    tBannerVC = nil;
}
- (IBAction)interstitialShow
{
    DMInterstitialViewController *tInterstitialVC = [[DMInterstitialViewController alloc] init];
    [self.navigationController pushViewController:tInterstitialVC animated:YES];
    [tInterstitialVC release];
    tInterstitialVC = nil;
}
@end
