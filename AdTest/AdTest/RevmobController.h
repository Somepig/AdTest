

@interface RevmobController : BaseViewController<RevMobAdsDelegate>
{
    UIScrollView *scroll;
}

@property (nonatomic, strong)RevMobFullscreen *fullscreen;
@property (nonatomic, strong)RevMobBannerView *banner;
@property (nonatomic, strong)RevMobBanner *bannerWindow;
@property (nonatomic, strong)RevMobAdLink *link;

@end
