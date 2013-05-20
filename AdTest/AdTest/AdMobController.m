//
//  AdMobController.m
//  Test
//
//  Created by lyywhg on 13-1-31.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "AdMobController.h"

@interface AdMobController ()

@end

@implementation AdMobController

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (void)dealloc
{
    _bannerView.delegate = nil;
    [_bannerView release];
    
    _interstitial.delegate = nil;
    [_interstitial release];
    
    [_BannerBtn release];
    [_InterstitialBtn release];
    [super dealloc];
}

- (GADBannerView *)bannerView
{
    if (!_bannerView)
    {
        _bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
        _bannerView.adUnitID = AdMobID;
        _bannerView.rootViewController = self;
        [_bannerView setDelegate:self];
        [self.view addSubview:_bannerView];
    }
    return _bannerView;
}

- (GADInterstitial *)interstitial
{
    if (!_interstitial)
    {
        _interstitial = [[GADInterstitial alloc] init];
        _interstitial.adUnitID = AdMobID;
        [_interstitial loadRequest:[GADRequest request]];
        [_interstitial presentFromRootViewController:self];
        _interstitial.delegate = self;
    }
    return _interstitial;
}
- (IBAction)showBannerView
{
    [self.bannerView loadRequest:[GADRequest request]];
}
- (IBAction)showInterstitial
{
    [self.interstitial loadRequest:[GADRequest request]];
}

- (void)bannerRequest
{
    GADRequest *request = [GADRequest request];
    
    request.testDevices = [NSArray arrayWithObjects:
                           @"F0877A67-F038-47C5-AD86-22A324A2F71D",
                           @"YOUR_DEVICE_IDENTIFIER",
                           nil];
    request.gender = kGADGenderMale;
    
    [request setBirthdayWithMonth:3 day:13 year:1976];
    [request setLocationWithDescription:@"94070 US"];
    
    [self.bannerView loadRequest:request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload
{
    [self setBannerBtn:nil];
    [self setInterstitialBtn:nil];
    [super viewDidUnload];
}
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad
{
    [self.interstitial presentFromRootViewController:self];
}
@end
