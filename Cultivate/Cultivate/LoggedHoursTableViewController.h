//
//  LoggedHoursTableViewController.h
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoggedHoursTableViewController : UITableViewController

@property (nonatomic) int entryIdToEdit;

- (IBAction) unwindLoggedHours:(UIStoryboardSegue*)segue;
//segue to return to the table view after a button action is used

- (IBAction)edit:(id)sender;



@end
