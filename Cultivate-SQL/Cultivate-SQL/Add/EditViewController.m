//
//  EditViewController.m
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/17/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EditViewController.h"
#import "DBManager.h"

@interface EditViewController ()

@property (nonatomic, strong) DBManager *dbManager;

-(void)loadInfoToEdit;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //make the EditViewController delegate of the text fields
    self.type.delegate =self;
    self.hours.delegate=self;
    self.date.delegate= self;

    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"cultivate.sql"];
    
    if(self.recordIDToEdit!= -1){
        [self loadInfoToEdit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
     
-(IBAction)saveInfo:(id)sender{
    //preparation of the query string, input to perform query in database
    NSString *query;
    if(self.recordIDToEdit == -1){
    query = [NSString stringWithFormat:@"INSERT INTO logEntry VALUES (null, '%@','%d', '%@');", self.type.text, [self.hours.text intValue], self.date.text];
    }
    else{
        query =[NSString stringWithFormat:@"update logEntry set type ='%@', set hours = '%d', set logDate = '%@' where logEntry id=%d", self.type.text, [self.hours.text intValue], self.date.text, self.recordIDToEdit];
    }
    
    [self.dbManager executeQuery:query];
    
    if(self.dbManager.affectedRows != 0){
        NSLog (@"Query was executed succesfully. Affected Rows = %d", self.dbManager.affectedRows);
        
        [self.delegate editInfoWasFinished];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
     }

-(void)loadInfoToEdit{
    NSString *query = [NSString stringWithFormat:@"select * from logEntry where logEntryID=%d", self.recordIDToEdit];
    
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDatabase:query]];
    self.type.text=[[results objectAtIndex:0] objectAtIndex:[self.dbManager.columnNames indexOfObject:@"type"]];
    self.hours.text=[[results objectAtIndex:0] objectAtIndex:[self.dbManager.columnNames indexOfObject:@"hours"]];
    self.date.text =[[results objectAtIndex:0]objectAtIndex:[self.dbManager.columnNames indexOfObject:@"logDate"]];
    
                        
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
