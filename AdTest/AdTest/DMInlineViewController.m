//
//  DMFirstViewController.m
//  DomobSample
//
//  Copyright (c) 2012年 domob. All rights reserved.
//

#import "DMInlineViewController.h"
#import "DMTools.h"

@interface DMInlineViewController ()
{
    CGSize _adSize;
    CGFloat _adX, _adY;
}
@end

@implementation DMInlineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Inline", @"Inline");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        // 确定广告尺寸及位置
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            _adSize = DOMOB_AD_SIZE_320x50;
        }
        else
        {
            _adSize = DOMOB_AD_SIZE_728x90;
            _adX = ([UIScreen mainScreen].bounds.size.width - _adSize.width) / 2;
            _adY = 44;
        }
    }
    return self;
}

- (void)dealloc
{
    _dmAdView.delegate = nil;
    _dmAdView.rootViewController = nil;
    [_dmAdView release];

    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    ////////////////////////////////////////////////////////////////////////////////////////////////    
    // 创建广告视图，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    _dmAdView = [[DMAdView alloc] initWithPublisherId:DomobID
                                          placementId:DomobPublicId
                                                 size:_adSize];
    // 设置广告视图的位置
    _dmAdView.frame = CGRectMake(_adX, _adY, _adSize.width, _adSize.height);
    
    _dmAdView.delegate = self; // 设置 Delegate
    _dmAdView.rootViewController = self; // 设置 RootViewController
    [self.view addSubview:_dmAdView]; // 将广告视图添加到父视图中
    [_dmAdView loadAd]; // 开始加载广告
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // 检查更新提醒，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    DMTools *_dmTools = [[DMTools alloc] initWithPublisherId:DomobID];
    [_dmTools checkRateInfo];
    [_dmTools release];
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
    {   
        _dmAdView.frame = CGRectMake((screenSize.height - _adSize.width) / 2,
                                     _adY,
                                     _dmAdView.frame.size.width,
                                     _dmAdView.frame.size.height);
    }
    else
    {
        _dmAdView.frame = CGRectMake((screenSize.width - _adSize.width) / 2,
                                     _adY,
                                     _dmAdView.frame.size.width,
                                     _dmAdView.frame.size.height);
    }
}

#pragma mark -
#pragma mark DMAdView delegate

// 成功加载广告后，回调该方法
- (void)dmAdViewSuccessToLoadAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] success to load ad.");
}

// 加载广告失败后，回调该方法
- (void)dmAdViewFailToLoadAd:(DMAdView *)adView withError:(NSError *)error
{
    NSLog(@"[Domob Sample] fail to load ad. %@", error);
}

// 当将要呈现出 Modal View 时，回调该方法。如打开内置浏览器。
- (void)dmWillPresentModalViewFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] will present modal view.");
}

// 当呈现的 Modal View 被关闭后，回调该方法。如内置浏览器被关闭。
- (void)dmDidDismissModalViewFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] did dismiss modal view.");
}

// 当因用户的操作（如点击下载类广告，需要跳转到Store），需要离开当前应用时，回调该方法
- (void)dmApplicationWillEnterBackgroundFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] will enter background.");
}

@end
