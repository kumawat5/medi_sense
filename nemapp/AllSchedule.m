//
//  AllSchedule.m
//  nemapp
//
//  Created by Ankur Kumawat on 17/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "AllSchedule.h"
#import "AllscheduleCell.h"
#import "Add.h"

@interface AllSchedule ()
@property (strong) NSMutableArray *devices;
@end

@implementation AllSchedule
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AllscheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    [cell.pill setText:[NSString stringWithFormat:@"%@ %@", [device valueForKey:@"pill"], [device valueForKey:@"dose"]]];
    [cell.time setText:[device valueForKey:@"time"]];
    cell.dot.layer.cornerRadius = 10;
    cell.dot.layer.masksToBounds = YES;
    
    if ([[device valueForKey:@"sa"] isEqualToString:@"Saturday"]) {
        [cell.sat_lbl setText:@"sa"];
       
    }
    if ([[device valueForKey:@"su"] isEqualToString:@"Sunday"]) {
        [cell.sun_lbl setText:@"Su"];
      

   }
   

    if ([[device valueForKey:@"m"] isEqualToString:@"Monday"]) {
        [cell.mon_lbl setText:@"M"];
       
    }
   if ([[device valueForKey:@"tu"] isEqualToString:@"Tuesday"]) {
        [cell.tue_lbl setText:@"Tu"];
      
        
    }
    
    if ([[device valueForKey:@"w"] isEqualToString:@"Wednesday"]) {
        [cell.wed_lbl setText:@"We"];
       
        
        
    }
  
    if ([[device valueForKey:@"th"] isEqualToString:@"Thursday"]) {
        [cell.thu_lbl setText:@"Th"];
       
        
        
    }
    
    if ([[device valueForKey:@"f"] isEqualToString:@"Friday"]) {
        [cell.fri_lbl setText:@"Fr"];
       
        
        
    }
//    else
//    {
//        cell.monday.constant=0;
//        cell.tuesday.constant=0;
//        cell.wednesday.constant=0;
//        cell.thursday.constant=0;
//        cell.friday.constant=0;
//        cell.saturday.constant=0;
//        cell.sunday.constant=0;
//    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"UpdateDevice"]) {
        NSManagedObject *selectedDevice = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        Add *destViewController = segue.destinationViewController;
        destViewController.device = selectedDevice;
    }
}

@end
