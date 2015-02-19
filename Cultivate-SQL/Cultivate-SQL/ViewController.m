//
//  ViewController.m
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/15/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"

@interface ViewController ()

@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *arrEntryInfo;
@property (nonatomic) int recordIDToEdit;

-(void) loadData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tblEntries.delegate = self;
    self.tblEntries.dataSource = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"cultivate.sql"];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addNewRecord:(id)sender{
    self.recordIDToEdit = -1;
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender: self];
    
}

-(void) loadData{
    NSString *query = @"select * from logEntry";
    if (self.arrEntryInfo != nil){
        self.arrEntryInfo = nil;
    }
    self.arrEntryInfo = [[NSArray alloc] initWithArray: [self.dbManager loadDataFromDatabase:query]];
    
    [self.tblEntries reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrEntryInfo.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    NSInteger indexOfType = [self.dbManager.columnNames indexOfObject:@"type"];
    NSInteger indexOfHours = [self.dbManager.columnNames indexOfObject:@"hours"];
    NSInteger indexOfDate = [self.dbManager.columnNames indexOfObject:@"logDate"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@ hours", [[self.arrEntryInfo objectAtIndex:indexPath.row] objectAtIndex:1], [[self.arrEntryInfo objectAtIndex:indexPath.row] objectAtIndex:2]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.arrEntryInfo objectAtIndex:indexPath.row] objectAtIndex:3]];
    
    return cell;
}

-(void)editInfoWasFinished{
    [self loadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    EditViewController *editViewController = [segue destinationViewController];
    editViewController.delegate = self;
    editViewController.recordIDToEdit = self.recordIDToEdit;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.recordIDToEdit = [[[self.arrEntryInfo objectAtIndex:indexPath.row] objectAtIndex:0]intValue];
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}


@end
