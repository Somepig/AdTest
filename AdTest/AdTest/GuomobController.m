//
//  SampleViewController.m
//  Guomob
//
//  Created by qq on 13-1-8.
//  Copyright (c) 2013年 AK. All rights reserved.
//

#import "GuomobController.h"

@implementation GuomobController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)dealloc
{

    if(interstitialAD!=nil)
    {
    [interstitialAD release];
    }
    if(interAD!=nil)
    {
    [interAD release];
    }
    if(textLinkAD!=nil)
    {
    [textLinkAD release];
    }
    if(bUiview!=nil)
    {
    [bUiview release];
    }
    
    if(jUiview!=nil)
    {
        [jUiview release];
    }
    
    [bgImageview release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    


    butSize.width=260;
    butSize.height=40;
    
    /************背景图****************************/
    bgImageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 440)];
    bgImageview.image=[UIImage imageNamed:@"Guomob_logo.png"];
    bgImageview.contentMode=UIViewContentModeCenter;
    
    //按钮
    but_bannerAD=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but_bannerAD.frame=CGRectMake((320-butSize.width)/2, 30, butSize.width, butSize.height);
    NSString *BannerADstr=[NSString stringWithFormat:@"横幅(Banner)广告 只需调用一次"];
    [but_bannerAD setTitle:BannerADstr forState:UIControlStateNormal];
    [but_bannerAD addTarget:self action:@selector(OnbannerAD:) forControlEvents:UIControlEventTouchUpInside];
    
    but_InterstitialAD=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but_InterstitialAD.frame=CGRectMake((320-butSize.width)/2, 80, butSize.width, butSize.height);
    NSString *InterstitialADstr=[NSString stringWithFormat:@"插屏广告"];
    [but_InterstitialAD setTitle:InterstitialADstr forState:UIControlStateNormal];
    [but_InterstitialAD addTarget:self action:@selector(OninterstitialAD:) forControlEvents:UIControlEventTouchUpInside];
    
    but_interAD=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but_interAD.frame=CGRectMake((320-butSize.width)/2, 130, butSize.width, butSize.height);
    NSString *InterADstr=[NSString stringWithFormat:@"全屏广告"];
    [but_interAD setTitle:InterADstr forState:UIControlStateNormal];
    [but_interAD addTarget:self action:@selector(OninterAD:) forControlEvents:UIControlEventTouchUpInside];
    
    but_textLinkAD=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but_textLinkAD.frame=CGRectMake((320-butSize.width)/2, 180, butSize.width, butSize.height);
    NSString *TextLinkADstr=[NSString stringWithFormat:@"JS文字链广告  只需调用一次"];
    [but_textLinkAD setTitle:TextLinkADstr forState:UIControlStateNormal];
    [but_textLinkAD addTarget:self action:@selector(OntextLinkAD:) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:bgImageview];
    [self.view addSubview:but_bannerAD];
    [self.view addSubview:but_InterstitialAD];
    [self.view addSubview:but_interAD];
    [self.view addSubview:but_textLinkAD];
   
    //创建插屏广告实列 并用应用密钥初始化 
    interstitialAD=[[GMInterstitialAD alloc] initWithId:GuomobId];
    interstitialAD.delegate=self; //必须实现
   
    
    //创建全屏广告实列 并用应用密钥初始化
    interAD=[[GMInterADView alloc] initWithId:GuomobId];
    interAD.delegate=self;  //必须实现
    
    //设备方向消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationChange) name:
     UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    if([bannerAD superview])
    {
        [bannerAD removeFromSuperview];
    }
    
    if([interstitialAD superview])
    {
        [interstitialAD removeFromSuperview];
    }
    
    if([interAD superview])
    {
        [interAD removeFromSuperview];
    }
    
    if([textLinkAD superview])
    {
        [textLinkAD removeFromSuperview];
    }
    
    if([bUiview superview])
    {
        [bUiview removeFromSuperview];
    }
    
    if([jUiview superview])
    {
        [jUiview removeFromSuperview];
    }
}
//横幅(Banner)广告
- (void)OnbannerAD:(UIButton *)sender
{
    
    //创建横幅(Banner)广告实列 并用应用密钥初始化
    bannerAD=[GuomobAdSDK initWithAppId:GuomobId delegate:self];
   
   //可以广告的位置,大小设屏幕即可以
   //bannerAD.frame=CGRectMake(30, 30 ,rect_screen.size.width, rect_screen.size.height);
    
    //加载广告 只需调用一次,不需要多次loadAd
    [bannerAD loadAd];
    
    //创建个空view
    bUiview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    bUiview.backgroundColor=[UIColor whiteColor];
    bUiview.userInteractionEnabled=YES;
    //返回按钮
    but_return=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but_return.frame=CGRectMake(320-60, self.view.frame.size.height-40, 50, 30);
    NSString *returnstr=[NSString stringWithFormat:@"返回"];
    [but_return setTitle:returnstr forState:UIControlStateNormal];
    [but_return addTarget:self action:@selector(OnReturn:) forControlEvents:UIControlEventTouchUpInside];
   
    [bUiview addSubview:bannerAD];
    [bUiview addSubview:but_return];
    [self.view addSubview:bUiview];
    
}
-(void)loadBanner
{
    [bannerAD removeFromSuperview];
     bannerAD=nil;
    
    [self OnbannerAD:nil];
}

//横幅(Banner)广告加载成功回调  success为yes
- (void)loadBannerAdSuccess:(BOOL)success
{
    NSLog(@"loadBannerAdSuccess====%d",success);
}


//插屏广告
- (void)OninterstitialAD:(UIButton *)sender
{
    //加载广告 参数YES表示您的app是否允许旋转,NO表示禁止旋转
    //再次加载 只需要loadInterstitialAd  不再需要再次创建实列并initWithId
    //但要先判断 并把此广告视图移除  类似viewDidUnload 中所示
    [interstitialAD loadInterstitialAd:YES];
    if([interstitialAD superview])
    {
        [interstitialAD removeFromSuperview];
    }
    [self.view addSubview:interstitialAD];
}

//插屏广告加载成功回调  success为yes
-(void)loadInterstitialAdSuccess:(BOOL)success
{
   NSLog(@"loadInterstitialAdSuccess====%d",success);
}
//全屏广告
- (void)OninterAD:(UIButton *)sender
{
    //加载广告 参数YES表示您的app是否允许旋转,NO表示禁止旋转
    //再次加载 只需要loadInterAd  不再需要再次创建实列并initWithId
    //但要先判断 并把此广告视图移除  如下
    [interAD loadInterAd:YES];
    if([interAD superview])
    {
        [interAD removeFromSuperview];
    }
    [self.view addSubview:interAD];
}

//全屏广告加载成功回调  success为yes
-(void)loadInterADSuccess:(BOOL)success
{
      NSLog(@"loadInterADSuccess====%d",success);
}

//JS文字链广告
- (void)OntextLinkAD:(UIButton *)sender
{
    //创建一个UIWebView控件 请求http://www.guomob.com/3.php 即可以
    CGRect webFrame=CGRectMake(0, 0, 320, 80);
    textLinkAD=[[UIWebView alloc]initWithFrame:webFrame];
    textLinkAD.delegate=self;
    NSURL * url = [[NSURL alloc] initWithString: @"http://www.guomob.com/3.php" ];
    NSURLRequest * request = [[[NSURLRequest alloc] initWithURL:url] autorelease];
    [textLinkAD loadRequest:request];
    
    //创建个空view
    jUiview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    jUiview.backgroundColor=[UIColor whiteColor];
    jUiview.userInteractionEnabled=YES;
    //返回按钮
    but_return=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but_return.frame=CGRectMake(320-60, self.view.frame.size.height-40, 50, 30);
    NSString *returnstr=[NSString stringWithFormat:@"返回"];
    [but_return setTitle:returnstr forState:UIControlStateNormal];
    [but_return addTarget:self action:@selector(OnReturn:) forControlEvents:UIControlEventTouchUpInside];
    
    [jUiview addSubview:textLinkAD];
    [jUiview addSubview:but_return];
    [self.view addSubview:jUiview];
}
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)OnReturn:(UIButton *)sender
{
    
   if([bannerAD superview])
   {
       [bannerAD removeFromSuperview];
       bannerAD=nil;
   }

   if([textLinkAD superview])
   {
       [textLinkAD removeFromSuperview];
   }
    
    if([bUiview superview])
    {
        [bUiview removeFromSuperview];
    }
    if([jUiview superview])
    {
        [jUiview removeFromSuperview];
    }


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
