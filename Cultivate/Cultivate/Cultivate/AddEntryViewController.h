//
//  AddEntryViewController.h
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "EntrySvcCoreData.h"


@interface AddEntryViewController : UIViewController

//text box properties
@property (weak, nonatomic) IBOutlet UITextField *type;
@property (weak, nonatomic) IBOutlet UITextField *hours;
@property (weak, nonatomic) IBOutlet UITextField *date;

@property (nonatomic) Entry *selectedEntry;
           
//button actions/handles
- (IBAction)saveButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButtonHandle;
- (IBAction)updateButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *updateButtonHandel;
- (IBAction)deleteButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteButtonHandle;

//method for setting the properties of a passed entry
-(void) setSelectedEntry:(Entry *)passedEntry;

//ManagedObject Context declaration
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end