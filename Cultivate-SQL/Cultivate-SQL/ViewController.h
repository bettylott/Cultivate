//
//  ViewController.h
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/15/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tblEntries;

-(IBAction)addNewRecord:(id)sender;

@end

