//
//  ViewController.h
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/15/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, EditViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblEntries;

-(IBAction)addNewRecord:(id)sender;

@end

