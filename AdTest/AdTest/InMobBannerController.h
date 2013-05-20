//
//  InMobInterstitialController.h
//  Test
//
//  Created by lyywhg on 13-5-19.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "BaseViewController.h"

@interface InMobBannerController : BaseViewController <IMAdDelegate>
{

	IMAdView *inmobiAdView;
    
}

- (void)loadInMobiAd;
@end

