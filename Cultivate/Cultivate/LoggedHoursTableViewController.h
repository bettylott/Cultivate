//
//  LoggedHoursTableViewController.h
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntrySvcCoreData.h"

@interface LoggedHoursTableViewController : UITableViewController

@property (nonatomic) NSIndexPath *selectedItemIndex;

- (IBAction)addEntryButton:(id)sender;


@end
