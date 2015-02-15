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
#import "UpdateEntryViewController.h"
//#import "EntrySvcCache.h"
//#import "EntrySvcArchive.h"
#import "EntrySvcSQLite.h"

@interface LoggedHoursTableViewController ()

@property NSMutableArray *logEntries;
//declares a Mutable Array to hold the properties of log entries

@end

@implementation LoggedHoursTableViewController

//EntrySvcCache *entrySvc= nil;
//EntrySvcArchive *entrySvc = nil;
EntrySvcSQLite *entrySvc = nil;

//-(void)loadInitialData {

    //sample data to test the protocols of the table view
    
//}

-(IBAction) unwindLoggedHours:(UIStoryboardSegue *)segue{
    //segue to move to table view after a button action
    
    //if (segue == addEntry){
    AddEntryViewController *source =[segue sourceViewController];
    LogEntry *type = source.logEntry;

    
    if (type != nil){
        [self.logEntries addObject:type];
        [self.tableView reloadData];
   }
    
    //else if (segue == updateEntry);
        //UpdateEntryViewController *source =[segue sourceViewController];
       // LogEntry *type = source.logEntry;
       // if(type !=nil){
            //[self.description setDescription:type];
      //  }//atttempting to tell the table view to unwind and pass the correct data to the tablevie from both the addEntry view controller and the updateEntryViewController
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //entrySvc = [[EntrySvcArchive alloc] init];
    entrySvc = [[EntrySvcSQLite alloc] init];
    self.logEntries = [[NSMutableArray alloc] init];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
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
    
    cell.textLabel.text = [logEntry description];
    
    return cell;
    
}




// Override to support conditional editing of the table view.
//(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
  //  return YES;
//}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.logEntries removeObjectAtIndex: indexPath.row];//tells the table view what to remove
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } //else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //this function not used in this application
   // }
}


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

#pragma mark - Table view delegate

 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    {
    [self.logEntries replaceObjectAtIndex:indexPath.row withObject:[LogEntry description]];
    }
}
#pragma mark - Navigation

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UpdateEntryViewController *source =[segue sourceViewController];
     LogEntry *type = source.logEntry;
     if(type !=nil){
         [self.LogEntries addObject:type];
         [self.tableView reloadData];
 //This is another attempt to pass the right data to the table view when a row is selelcted to update.
         
      }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)edit:(id)sender {

}


@end
