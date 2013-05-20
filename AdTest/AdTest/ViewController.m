//
//  ViewController.m
//  Test
//
//  Created by lyywhg on 13-1-29.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import "ViewController.h"
#define CELL_HEIGTH 50.0f

@interface ViewController ()

@end

@implementation ViewController
#pragma mark-
#pragma mark Init & Dealloc
- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"首页";
    }
    return self;
}
- (void)dealloc
{
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
    [_tableView release];
    _tableView = nil;
    
    [_adArray release];
    _adArray = nil;
    
    [super dealloc];
}
#pragma mark-
#pragma mark Init & Add
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		[_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
		[_tableView setIndicatorStyle:UIScrollViewIndicatorStyleDefault];
		_tableView.scrollEnabled = NO;
		_tableView.userInteractionEnabled = YES;
		_tableView.delegate =self;
		_tableView.dataSource =self;
		_tableView.backgroundColor =[UIColor colorWithRed:225.0/255.0f  green:225.0/255.0f blue:225.0/255.0f  alpha:1];
        _tableView.backgroundView = nil;
    }
    return _tableView;
}
- (NSArray *)adArray
{
    if (!_adArray)
    {
        _adArray = [[NSArray alloc] initWithObjects:@"iAd", @"AdMob", @"InMobi", /*@"Chartboost",*/ @"Revmob", @"Domob",/* @"YouMi",*/ @"Guomob", nil];
    }
    return _adArray;
}
#pragma mark-
#pragma mark TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.adArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableCellIdentifier = @"TableCellIdentifier";
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:TableCellIdentifier];
    if (tableCell == nil)
    {
        tableCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableCellIdentifier] autorelease];
    }
    tableCell.textLabel.text = [self.adArray objectAtIndex:[indexPath row]];
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row])
    {
        case 0:
            [self iAdController];
            break;
        case 1:
            [self AdMobController];
            break;
        case 2:
            [self InMobiController];
            break;
        /*case 3:
            [self ChartboostController];
            break;*/
        case 3:
            [self RevmobController];
            break;
        case 4:
            [self DomobController];
            break;
        /*case 6:
            [self YouMiController];
            break;*/
        case 5:
            [self GuomobController];
            break;
        default:
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGTH;
}
#pragma mark-
#pragma mark View Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)iAdController
{
    iAdController *tiAdC = [[iAdController alloc] init];
    tiAdC.title = @"iAd";
    [self.navigationController pushViewController:tiAdC animated:YES];
    [tiAdC release];
    tiAdC = nil;
}
- (void)AdMobController
{
    AdMobController *tAdMobC = [[AdMobController alloc] init];
    tAdMobC.title = @"AdMob";
    [self.navigationController pushViewController:tAdMobC animated:YES];
    [tAdMobC release];
    tAdMobC = nil;
}
- (void)InMobiController
{
    InMobiController *tInMobiC = [[InMobiController alloc] init];
    tInMobiC.title = @"InMobi";
    [self.navigationController pushViewController:tInMobiC animated:YES];
    [tInMobiC release];
    tInMobiC = nil;
}
- (void)ChartboostController
{
    ChartboostController *tChartboostC = [[ChartboostController alloc] init];
    tChartboostC.title = @"Chartboost";
    [self.navigationController pushViewController:tChartboostC animated:YES];
    [tChartboostC release];
    tChartboostC = nil;
}
- (void)RevmobController
{
    RevmobController *tRevmobC = [[RevmobController alloc] init];
    tRevmobC.title = @"Revmob";
    [self.navigationController pushViewController:tRevmobC animated:YES];
    [tRevmobC release];
    tRevmobC = nil;
}
- (void)DomobController
{
    DomobController *tDomobC = [[DomobController alloc] init];
    tDomobC.title = @"Domob";
    [self.navigationController pushViewController:tDomobC animated:YES];
    [tDomobC release];
    tDomobC = nil;
}
- (void)YouMiController
{
    YouMiController *tYouMiC = [[YouMiController alloc] init];
    tYouMiC.title = @"YouMi";
    [self.navigationController pushViewController:tYouMiC animated:YES];
    [tYouMiC release];
    tYouMiC = nil;
}
- (void)GuomobController
{
    GuomobController *tGuomobC = [[GuomobController alloc] init];
    tGuomobC.title = @"Guomob";
    [self.navigationController pushViewController:tGuomobC animated:YES];
    [tGuomobC release];
    tGuomobC = nil;
    
}
//- (DomobV *)tmpDomobV
//{
//    if (!_tmpDomobV)
//    {
//        _tmpDomobV = [[DomobV alloc] init];
//        _tmpDomobV.frame = CGRectMake(0, 0, 320, 350);
//        _tmpDomobV.domobVC = self;
//        [self.view addSubview:_tmpDomobV];
//    }
//    return _tmpDomobV;
//}
//- (DomobController *)tmpDomobVC
//{
//    if (!_tmpDomobVC)
//    {
//        _tmpDomobVC = [[DomobController alloc] init];
//        _tmpDomobVC.view.backgroundColor = [UIColor clearColor];
//    }
//    return _tmpDomobVC;
//}
//- (ChartboostV *)tmpChartboostV
//{
//    if (!_tmpChartboostV)
//    {
//        _tmpChartboostV = [[ChartboostV alloc] init];
//        _tmpChartboostV.frame = CGRectMake(0, 0, 320, 480);
//        [self.view addSubview:_tmpChartboostV];
//    }
//    return _tmpChartboostV;
//}
//
//
//- (void)DomobVShow
//{
//    [self.tmpDomobV loadDomobTraditionScreen];
//}
//- (void)DomobVCShow
//{
//    [self.tmpDomobVC loadDomobTableScreen];
//    [self.tmpDomobVC isDomobTableScreenReady];
//    [self pushViewController:self.tmpDomobVC animated:NO];
//}
//
//- (void)RevmobShow
//{
//    RevmobController *tmpRevmobVC = [[RevmobController alloc] init];
//    [self pushViewController:tmpRevmobVC animated:YES];
//}
//
//- (void)MopubShow
//{
//    MopubController *tmpMopubVC = [[MopubController alloc] init];
//    [self pushViewController:tmpMopubVC animated:YES];
//}
//
//- (void)iAdShow
//{
//    iAdController *tmpiAdVC = [[iAdController alloc] init];
//    [self pushViewController:tmpiAdVC animated:YES];
//}
//
//- (void)AdmobShow
//{
//    AdMobController *tmpAdmob = [[AdMobController alloc] init];
//    [self pushViewController:tmpAdmob animated:YES];
//}

@end
