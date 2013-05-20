//
//  InMobInterstitialController.m
//  Test
//
//  Created by lyywhg on 13-5-19.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "InMobInterstitialController.h"
#import "AppDelegate.h"

@implementation InMobInterstitialController

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Display-Time Lifecycle Notifications

- (void)interstitialDidFinishRequest:(IMAdInterstitial *)ad
{
    NSLog(@"interstitialDidFinishRequest");
    [showAd setEnabled:YES];
    [showAd setAlpha:1];
    [refreshAd setEnabled:YES];
    [refreshAd setAlpha:1];
}

- (void)interstitial:(IMAdInterstitial *)interstitial
didFailToReceiveAdWithError:(IMAdError *)error
{
    NSLog(@"interstitial did fail with error=%@",[error localizedDescription]);
    NSLog(@"error code=%d",[error code]);
    [refreshAd setEnabled:YES];
    [refreshAd setAlpha:1];
}

- (void)interstitialWillPresentScreen:(IMAdInterstitial *)ad
{
    NSLog(@"interstitialWillPresentScreen");
}

- (void)interstitial:(IMAdInterstitial *)ad didFailToPresentScreenWithError:(IMAdError *)error {
    NSLog(@"interstitial failed to present screen.. error = %@",[error localizedDescription]);
}

- (void)interstitialWillDismissScreen:(IMAdInterstitial *)ad {
    NSLog(@"interstitialWillDismissScreen");  
}

- (void)interstitialDidDismissScreen:(IMAdInterstitial *)ad {
    NSLog(@"interstitialDidDismissScreen");
}

- (void)interstitialWillLeaveApplication:(IMAdInterstitial *)ad {
    NSLog(@"interstitialWillLeaveApplication");    
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Interstitial Ad";
    refreshAd = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	[refreshAd setTitle:@"Refresh Interstitial" forState:UIControlStateNormal];
	[refreshAd setFrame:CGRectMake(60, 335, 200, 30)];
	[refreshAd addTarget:self action:@selector(refreshAd) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:refreshAd];
    
    showAd = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	[showAd setTitle:@"Show Interstitial" forState:UIControlStateNormal];
	[showAd setFrame:CGRectMake(60, 280, 200, 30)];
	[showAd addTarget:self action:@selector(showAd) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:showAd];
	[showAd setEnabled:NO];
    [showAd setAlpha:0];
    interstitialAd = [[IMAdInterstitial alloc] init];
    interstitialAd.delegate = self;
    interstitialAd.imAppId = InMobiID;
    [self refreshAd];
}

- (void)showAd {
    [interstitialAd presentFromRootViewController:self.navigationController animated:YES];
}

- (void)refreshAd {
    [showAd setEnabled:NO];
    [showAd setAlpha:0];
    [refreshAd setEnabled:NO];
    [refreshAd setAlpha:0];
    IMAdRequest *request = [IMAdRequest request];
    [interstitialAd loadRequest:request];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    interstitialAd.delegate = nil;
    [interstitialAd release]; interstitialAd = nil;
    [showAd release]; showAd = nil;
    [refreshAd release]; refreshAd = nil;
    [super dealloc];
}

@end
