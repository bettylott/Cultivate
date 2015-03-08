//
//  ViewController.m
//  Cultivate Final
//
//  Created by Lisa Matter on 2/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "EntryTableViewController.h"

@interface ViewController ()



@end

@implementation ViewController

@synthesize entry;
int trainingHours;
int changeTrainingHours;
int newHours;

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(int) fetchTrainingHourTotal{
    
    return trainingHours;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog (@"Loading, entry = %@, %@, %@", [self.entry valueForKey:@"type"],[self.entry valueForKey:@"hours"], [self.entry valueForKey:@"date"]);
    
    if (self.entry) {
        [self.typeTextField setText:[self.entry valueForKey:@"type"]];
        [self.hoursTextField setText:[self.entry valueForKey:@"hours"]];
        [self.dateTextField setText:[self.entry valueForKey:@"date"]];
        NSLog (@"Entry = %@, %@, %@", [self.entry valueForKey:@"type"],[self.entry valueForKey:@"hours"], [self.entry valueForKey:@"date"]);
        
    }
    
    [self determineChangeTrainingHours];
    NSString *convertHoursToString = [NSString stringWithFormat: @"%i", trainingHours];
    [self.trainingTotalTextField setText: convertHoursToString];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
        NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.entry) {
        NSLog (@"Set text for updates = %@, %@, %@", [self.entry valueForKey:@"type"], [self.entry valueForKey:@"hours"], [self.entry valueForKey:@"date"]);
        [self.entry setValue:self.typeTextField.text forKey:@"type"];
        [self.entry setValue:self.hoursTextField.text forKey:@"hours"];
        [self.entry setValue:self.dateTextField.text forKey:@"date"];
        NSLog (@"hours = %@", [self.entry valueForKey:@"hours"]);
        NSLog (@"updated entry sent to table");
        
        trainingHours = trainingHours + [[self.entry valueForKey:@"hours"] intValue];
        NSString *convertHoursToString = [NSString stringWithFormat: @"%i", trainingHours];
        [self.trainingTotalTextField setText: convertHoursToString];
    }
    
    else{
    
        // Create a new managed object
        NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
        NSLog (@"Input new object");
        [newEntry setValue:self.typeTextField.text forKey:@"type"];
        [newEntry setValue:self.hoursTextField.text forKey:@"hours"];
        [newEntry setValue:self.dateTextField.text forKey:@"date"];
        newHours = [[newEntry valueForKey: @"hours"] intValue];
        NSLog (@"newHours = %i", newHours);
        
        trainingHours = trainingHours + newHours;
        NSString *convertHoursToString = [NSString stringWithFormat: @"%i", trainingHours];
        [self.trainingTotalTextField setText: convertHoursToString];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
    }
        [self dismissViewControllerAnimated:YES completion:nil];
    }

- (IBAction)cancelButton:(id)sender {
    NSLog (@"cancel button, back to table");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(int) determineChangeTrainingHours{
    
    changeTrainingHours =[[self.entry valueForKey:@"hours"] intValue];
    
    NSLog (@"changeTrainingHours = %i", changeTrainingHours);
    NSLog (@"trainingHours %i", trainingHours);
    
    trainingHours = trainingHours - changeTrainingHours;
    
    NSLog (@"after equation trainingHours = %i", trainingHours);
    
    return trainingHours;
}




@end
