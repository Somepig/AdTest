//
//  InMobiController.h
//  Test
//
//  Created by lyywhg on 13-5-19.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "BaseViewController.h"
#import "InMobBannerController.h"
#import "InMobInterstitialController.h"

@interface InMobiController : BaseViewController
@property (retain, nonatomic) IBOutlet UIButton *BannerBtn;
@property (retain, nonatomic) IBOutlet UIButton *InterstitialBtn;

- (IBAction)bannerShow;
- (IBAction)InterstitialShow;

@end
