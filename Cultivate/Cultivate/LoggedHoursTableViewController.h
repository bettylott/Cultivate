//
//  LoggedHoursTableViewController.h
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoggedHoursTableViewController : UITableViewController

- (IBAction) unwindLoggedHours:(UIStoryboardSegue*)segue;
//segue to return to the table view after a button action is used

@end
