//
//  InMobiController.m
//  Test
//
//  Created by lyywhg on 13-5-19.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "InMobiController.h"

@interface InMobiController ()

@end

@implementation InMobiController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_BannerBtn release];
    [_InterstitialBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setBannerBtn:nil];
    [self setInterstitialBtn:nil];
    [super viewDidUnload];
}

- (IBAction)bannerShow
{
    InMobBannerController *tInMobBannerC = [[InMobBannerController alloc] init];
    [self.navigationController pushViewController:tInMobBannerC animated:YES];
    [tInMobBannerC release];
    tInMobBannerC = nil;
}
- (IBAction)InterstitialShow
{
    InMobInterstitialController *tInterstitialC = [[InMobInterstitialController alloc] init];
    [self.navigationController pushViewController:tInterstitialC animated:YES];
    [tInterstitialC release];
    tInterstitialC = nil;
}
@end
