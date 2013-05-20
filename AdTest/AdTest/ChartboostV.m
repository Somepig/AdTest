//
//  Chartboost.m
//  Test
//
//  Created by lyywhg on 13-1-30.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "ChartboostV.h"

@implementation ChartboostV

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (Chartboost *)chartboostV
{
    if (!_chartboostV)
    {
        _chartboostV = [Chartboost sharedChartboost];
        _chartboostV.appId = ChartboostID;
        _chartboostV.appSignature = ChartboostappSignature;
        
    }
    return _chartboostV;
}
- (void)chartboostVStart
{
    [self.chartboostV startSession];
}

- (void)showChartBoost
{
    // Show an interstitial
    [self.chartboostV showInterstitial];
    NSLog(@"she");
}

@end
