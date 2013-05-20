//
//  InMobInterstitialController.h
//  Test
//
//  Created by lyywhg on 13-5-19.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"


@interface InMobInterstitialController : BaseViewController <IMAdInterstitialDelegate> {
    IMAdInterstitial *interstitialAd;
    UIButton *refreshAd,*showAd;
}

- (void)refreshAd;
- (void)showAd;
@end
