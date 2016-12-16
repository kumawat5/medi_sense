//
//  TodayList.m
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "TodayList.h"
#import "TodayTableViewCell.h"


@interface TodayList ()
{
    NSMutableArray *patterns;
    NSMutableArray *patternImages;
}

@property (strong) NSMutableArray *devices;
@end

@implementation TodayList
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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    //monday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Monday"]) {
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
//    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
   fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(m = %@)", @"Monday"];
     _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
    [self.tableView reloadData];
    }
    //tuesday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Tuesday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(tu = %@)", @"Tuesday"];
        _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
        [self.tableView reloadData];
    }
    //wednesday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Wednesday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(w = %@)", @"Wednesday"];
        _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
        [self.tableView reloadData];
    }
    //thursday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Thursday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(th = %@)", @"Thursday"];
        _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
        [self.tableView reloadData];
    }
    //friday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Friday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(f = %@)", @"Friday"];
        _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
        [self.tableView reloadData];
    }
    //saturday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Saturday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(sa = %@)", @"Saturday"];
        _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
        [self.tableView reloadData];
    }
    //sunday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Sunday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(su = %@)", @"Sunday"];
        _devices = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
        [self.tableView reloadData];
    }






}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.devices.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    TodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Add utility buttons
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
                                                icon:[UIImage imageNamed:@"Screen Shot 2016-12-16 at 5.16.34 PM.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
                                                icon:[UIImage imageNamed:@"Screen Shot 2016-12-16 at 5.16.34 PM.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
                                                icon:[UIImage imageNamed:@"Screen Shot 2016-12-16 at 5.16.34 PM.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:0.7]
                                                icon:[UIImage imageNamed:@"Screen Shot 2016-12-16 at 5.16.10 PM.png"]];
    
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
//                                                title:@"More"];
//    [rightUtilityButtons sw_addUtilityButtonWithColor:
//     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
//                                                title:@"Delete"];
    
    cell.leftUtilityButtons = leftUtilityButtons;
    cell.rightUtilityButtons = rightUtilityButtons;
    cell.delegate = self;

    
    // Configure the cell...
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    [cell.name_dose setText:[NSString stringWithFormat:@"%@ - %@", [device valueForKey:@"pill"], [device valueForKey:@"dose"]]];
    [cell.time setText:[device valueForKey:@"time"]];
    [cell.takentime setText:[device valueForKey:@"timetakentoday"]];
    
    if ([[device valueForKey:@"todaystatus"] isEqualToString:@"taken"]) {
       [cell.dot setBackgroundColor:[UIColor greenColor]];
    }
    
    cell.dot.layer.cornerRadius = 10;
    cell.dot.layer.masksToBounds = YES;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state{
    if(state ==1){
        
        // current date
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"h:mm a";
        [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        
        //current date
        NSDate *todayDate = [NSDate date];
        NSDateFormatter *dateFormatters = [[NSDateFormatter alloc] init];
        [dateFormatters setDateFormat:@"dd-MM-yyyy"];         NSString *convertedDateString = [dateFormatters stringFromDate:todayDate];

        
        NSIndexPath *indexPaths = [self.tableView indexPathForCell:cell];
        NSLog(@"%ld",(long)indexPaths.row);
         TodayTableViewCell*cell = [self.tableView cellForRowAtIndexPath:indexPaths];
        [cell.dot setBackgroundColor:[UIColor greenColor]];
        [cell.takentime setText:[dateFormatter stringFromDate:now]];
        
        //update device
        NSManagedObject *selectedDevices = [self.devices objectAtIndex:[self.tableView indexPathForCell:cell].row];
        
        [selectedDevices setValue:[dateFormatter stringFromDate:now] forKeyPath:@"timetakentoday"];
        [selectedDevices setValue:@"taken" forKeyPath:@"todaystatus"];
        [selectedDevices setValue:convertedDateString forKeyPath:@"todaydate"];
        
        NSError *saveError = nil;
        [self.managedObjectContext save:&saveError];
        if (saveError)
        {
            
        }
        else
        {
            
            
        }
    }
}


@end
