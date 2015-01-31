//
//  ViewController.m
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "ViewController.h"

#import "Entry.h"
#import "EntrySvcCache.h"
#import "EntrySvcCache.m"

@interface ViewController ()

@end

@implementation ViewController

EntrySvcCache *entrySvc = nil;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    entrySvc = [[EntrySvcCache alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEntry:(id)sender {
    NSLog (@"saveEntry:entering");
    
    [self.view endEditing: YES];
    
    Entry *entry =[[Entry alloc] init];
    entry.type = _type.text;
    entry.hours =_hours.text;
    entry.date = _date.text;
    [entrySvc createEntry:entry];
    
    [self.tableView reloadData];
    NSLog(@"saveEntry:entry saved");
}

- (IBAction)deleteEntry:(id)sender {
    NSLog (@"deleteEntry");
    
    [self.view endEditing:YES];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"loggedHours"])
    {
    
    SecondViewController *destinationViewController =(SecondViewController *)segue.destinationViewController;
        [destinationViewController ]
            }
}


;
@end
