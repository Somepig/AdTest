//
//  ViewController.h
//  Test
//
//  Created by lyywhg on 13-1-29.
//  Copyright (c) 2013年 lyywhg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdsHeader.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *adArray;

@end
