//
//  DMSecondViewController.h
//  DomobSample
//
//  Copyright (c) 2012年 domob. All rights reserved.
//

#import "DMInterstitialAdController.h"

@interface DMInterstitialViewController : BaseViewController <DMInterstitialAdControllerDelegate>
{
    DMInterstitialAdController *_dmInterstitial;
}

@property (nonatomic, retain) IBOutlet UIButton *presentBtn;

- (IBAction)onPresentBtnClicked:(id)sender;

@end
