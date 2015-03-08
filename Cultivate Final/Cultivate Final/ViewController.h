//
//  ViewController.h
//  Cultivate Final
//
//  Created by Lisa Matter on 2/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *hoursTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;

@property (strong) NSManagedObject *entry;

@property (weak, nonatomic) IBOutlet UILabel *trainingTotalLabel;

@property (weak, nonatomic) IBOutlet UITextField *trainingTotalTextField;

- (IBAction)saveButton:(id)sender;

- (IBAction)cancelButton:(id)sender;

@end

