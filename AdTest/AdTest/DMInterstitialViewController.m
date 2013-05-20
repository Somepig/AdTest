//
//  DMSecondViewController.m
//  DomobSample
//
//  Copyright (c) 2012年 domob. All rights reserved.
//

#import "DMInterstitialViewController.h"

@interface DMInterstitialViewController ()

@end

@implementation DMInterstitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Interstitial", @"Interstitial");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize adSize;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        adSize = DOMOB_AD_SIZE_300x250;
    }
    else
    {
        adSize = DOMOB_AD_SIZE_600x500;
    }
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    //　初始化插屏广告，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    _dmInterstitial = [[DMInterstitialAdController alloc] initWithPublisherId:DomobID placementId:DomobPublicId rootViewController:rootViewController size:adSize];
    // 设置插屏广告的Delegate
    _dmInterstitial.delegate = self;
    // 加载一条插屏广告
    [_dmInterstitial loadAd];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    _dmInterstitial.delegate = nil; // 释放插屏广告对象前，请先将其delegate设置为nil
    [_dmInterstitial release]; // 释放插屏广告对象
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onPresentBtnClicked:(id)sender
{
    // 在需要呈现插屏广告前，先通过isReady方法检查广告是否就绪
    if (_dmInterstitial.isReady)
    {
        // 呈现插屏广告
        [_dmInterstitial present];
    }
    else
    {
        // 如果还没有ready，可以再调用loadAd
        [_dmInterstitial loadAd];
    }
}

#pragma mark -
#pragma mark DMInterstitialAdController Delegate
// 当插屏广告被成功加载后，回调该方法
- (void)dmInterstitialSuccessToLoadAd:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] success to load ad.");
    self.presentBtn.hidden = NO;
}

// 当插屏广告加载失败后，回调该方法
- (void)dmInterstitialFailToLoadAd:(DMInterstitialAdController *)dmInterstitial withError:(NSError *)err
{
    NSLog(@"[Domob Interstitial] fail to load ad. %@", err);
}

// 当插屏广告要被呈现出来前，回调该方法
- (void)dmInterstitialWillPresentScreen:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] will present.");
}

// 当插屏广告被关闭后，回调该方法
- (void)dmInterstitialDidDismissScreen:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] did dismiss.");

    // 插屏广告关闭后，加载一条新广告用于下次呈现
    [_dmInterstitial loadAd];
}

// 当将要呈现出 Modal View 时，回调该方法。如打开内置浏览器。
- (void)dmInterstitialWillPresentModalView:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] will present modal view.");
}

// 当呈现的 Modal View 被关闭后，回调该方法。如内置浏览器被关闭。
- (void)dmInterstitialDidDismissModalView:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] did dismiss modal view.");
}

// 当因用户的操作（如点击下载类广告，需要跳转到Store），需要离开当前应用时，回调该方法
- (void)dmInterstitialApplicationWillEnterBackground:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] will enter background.");
}

@end
