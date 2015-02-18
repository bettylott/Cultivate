//
//  EditViewController.h
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/17/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *type;

@property (weak, nonatomic) IBOutlet UITextField *hours;

@property (weak, nonatomic) IBOutlet UITextField *date;


-(IBAction)saveInfo:(id)sender;


@end
