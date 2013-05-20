//
//  AdMobController.h
//  Test
//
//  Created by lyywhg on 13-1-31.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "AppDelegate.h"

@interface AdMobController : BaseViewController<GADBannerViewDelegate, GADInterstitialDelegate>

@property (retain, nonatomic) IBOutlet UIButton *BannerBtn;
@property (retain, nonatomic) IBOutlet UIButton *InterstitialBtn;

@property (nonatomic, retain) GADBannerView *bannerView;
@property (nonatomic, retain) GADInterstitial *interstitial;

- (IBAction)showBannerView;
- (IBAction)showInterstitial;

@end
