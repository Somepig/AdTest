//
//  SampleViewController.h
//  Guomob
//
//  Created by qq on 13-1-8.
//  Copyright (c) 2013年 AK. All rights reserved.
//


@interface GuomobController : BaseViewController<UIWebViewDelegate,GuomobAdSDKDelegate,GMInterADViewDelegate,GMInterstitialDelegate,SKStoreProductViewControllerDelegate>
{
    //横幅(Banner)广告
    GuomobAdSDK *bannerAD;
    //插屏广告
    GMInterstitialAD *interstitialAD;
    //全屏广告
    GMInterADView *interAD;
    //加载js文字链广告
    UIWebView *textLinkAD;

    //Sample背景图
    UIImageView *bgImageview;
    
   CGSize butSize;
    
   UIButton *but_bannerAD;
   UIButton *but_InterstitialAD;
   UIButton *but_interAD;
   UIButton *but_textLinkAD;
    
   UIView *bUiview;
   UIView *jUiview;
    
   UIButton *but_return;    
}
@end
