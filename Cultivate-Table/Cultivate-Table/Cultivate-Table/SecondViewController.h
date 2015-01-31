//
//  SecondViewController.h
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/30/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntrySvcCache.m"
#import "EntrySvc.h"
#import "EntrySvcCache.h"
#import "Entry.h"
@class ViewController;


@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
