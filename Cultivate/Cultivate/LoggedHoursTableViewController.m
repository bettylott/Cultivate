//
//  LoggedHoursTableViewController.m
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "LoggedHoursTableViewController.h"
#import "LogEntry.h"
#import "AddEntryViewController.h"

@interface LoggedHoursTableViewController ()

@property NSMutableArray *logEntries;
//declares a Mutable Array to hold the properties of log entries

@end

@implementation LoggedHoursTableViewController

-(void)loadInitialData {
    LogEntry *logEntry1 = [[LogEntry alloc] init];
    logEntry1.type=@"training";
    [self.logEntries addObject:logEntry1];
    LogEntry *logEntry2 = [[LogEntry alloc] init];
    logEntry2.type=@"coaching";
    [self.logEntries addObject:logEntry2];
    LogEntry *logEntry3 = [[LogEntry alloc] init];
    logEntry3.type=@"observation";
    [self.logEntries addObject:logEntry3];
    LogEntry *logEntry4 = [[LogEntry alloc] init];
    logEntry4.type=@"training";
    [self.logEntries addObject:logEntry4];
    //sample data to test the protocols of the table view
    
}

-(IBAction) unwindLoggedHours:(UIStoryboardSegue *)segue{
    //segue to move to table view after a button action
    
    AddEntryViewController *source =[segue sourceViewController];
    LogEntry *type = source.logEntry;
    
    if (type != nil){
        [self.logEntries addObject:type];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logEntries = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
    //with return one this will allow for one section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.logEntries count];
    //this will count the number of logs within the logEntries property
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    LogEntry *logEntry = [self.logEntries objectAtIndex:indexPath.row];
    cell.textLabel.text = logEntry.type;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
