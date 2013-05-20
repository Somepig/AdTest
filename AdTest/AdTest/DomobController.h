//
//  DomobController.h
//  Test
//
//  Created by lyywhg on 13-5-20.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "BaseViewController.h"
#import "DMInlineViewController.h"
#import "DMInterstitialViewController.h"

@interface DomobController : BaseViewController<DMAdViewDelegate>

@property (nonatomic, retain) IBOutlet UIButton *bannerBtn;
@property (nonatomic, retain) IBOutlet UIButton *Interstitial;

@property (nonatomic, retain) DMAdView *dmAdView;

- (IBAction)bannerShow;
- (IBAction)interstitialShow;

@end
