//
//  ViewController.h
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *type;
@property (weak, nonatomic) IBOutlet UITextField *hours;
@property (weak, nonatomic) IBOutlet UITextField *date;
- (IBAction)saveEntry:(id)sender;
- (IBAction)deleteEntry:(id)sender;

@end

