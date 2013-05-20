//
//  AppDelegate.m
//  Test
//
//  Created by lyywhg on 13-1-29.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_nav release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.nav = [[UINavigationController alloc] init];
    ViewController *viewC = [[ViewController alloc] init];
    [self.nav pushViewController:viewC animated:YES];
    self.window.rootViewController = self.nav;
    [self.window makeKeyAndVisible];
    
    
    [RevMobAds startSessionWithAppID:RevmobID];
    
    if (NSClassFromString(@"ASIdentifierManager"))
    {
        NSLog(@"GoogleAdMobAdsSDK ID for testing: %@" ,
              [[[ASIdentifierManager sharedManager]
                advertisingIdentifier] UUIDString]);
    }
    
    
    //UmengSDK调用
    [self umengTrack];
    //谷歌
    [self googleInterstitialTrack];
    //Chartboost
    [self chartboostInterstitialTrack];
    
    
    return YES;
}

- (void)umengTrack
{
    [MobClick startWithAppkey:UmengID reportPolicy:(ReportPolicy)BATCH channelId:nil];
}
- (void)googleInterstitialTrack
{
    GADInterstitial *splashInterstitial_ = [[GADInterstitial alloc] init];
    splashInterstitial_.adUnitID = AdMobID;
    [splashInterstitial_ loadAndDisplayRequest:[GADRequest request]
                                   usingWindow:self.window
                                  initialImage:[UIImage imageNamed:@"Default.png"]];
}
- (void)chartboostInterstitialTrack
{
    Chartboost *cb = [Chartboost sharedChartboost];
    cb.appId = ChartboostID;
    cb.appSignature = ChartboostappSignature;
    
    // Begin a user session
    [cb startSession];
    // Show an interstitial
    [cb showInterstitial];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    Chartboost *cb = [Chartboost sharedChartboost];
    
    cb.appId = @"YOUR_CHARTBOOST_APP_ID";
    cb.appSignature = @"YOUR_CHARTBOOST_APP_SIGNATURE";
    // Begin a user session
    [cb startSession];

    // Show an interstitial
    [cb showInterstitial];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[RevMobAds session] processLocalNotification:notification];
}

@end
