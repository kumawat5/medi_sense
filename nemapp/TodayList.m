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
    NSMutableArray*mutable_ary;
    NSString *TimeString;
}

@property (strong) NSMutableArray *devices;
@property (strong) NSMutableArray *dev;

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
    NSString *valueToSave = @"2";
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"preferenceName"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    
    /////////////
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Cal"];
    //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    fetchRequest.predicate = [NSPredicate predicateWithFormat: @"(day = %@)", @"Friday"];
    _dev = [managedObjectContext executeFetchRequest:fetchRequest error:nil];
    NSLog(@"%@",_dev);
    
//    NSManagedObject *newVehicle=[self.managedObjectContext executeFetchRequest:fetchRequest error:nil] ;
//     if (newVehicle) {
//    [newVehicle setValue:@"ankurkumawat" forKey:@"takenstatus"];
//         [self.managedObjectContext save:nil];
//     }
//    NSError *error = nil;
//    // Save the object to persistent store
//    if (![managedObjectContext save:&error]) {
//        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//    }
//---------------------------------------------------------//
//    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    NSEntityDescription *sysCounters = [NSEntityDescription entityForName:@"Cal" inManagedObjectContext:managedObjectContext];
//    [request setEntity:sysCounters];
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(day == %@)", @"Friday"];
//    
//                              [request setPredicate:predicate];
//                              
//                              NSError *error = nil;
//                              NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
//    NSLog(@"%@",results);
//                              for (NSManagedObject *obj in results) {
//                                  [obj setValue:@"kumawat" forKey:@"takenstatus"];
//                                  
//                                  [managedObjectContext save:&error];
//                              }

    
   //all notification NSLog---------
    //NSLog(@"scheduled notifications: --%@----", [[UIApplication sharedApplication] scheduledLocalNotifications]);
    //self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
    ////////////////////////////////////////////////////////////////
    
        [self.tableView setSeparatorColor:[UIColor clearColor]];
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
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
                                          [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
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
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
                                          [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
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
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
                                          [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
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
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
                                          [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
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
        //  Define how we will sort the records
       
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
        [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
        
        _devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
        
        [self.tableView reloadData];
    }
    //saturday
    if ([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Saturday"]) {
        // Fetch the devices from persistent data store
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
        //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
                                          [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
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
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:
                                          [[NSSortDescriptor alloc] initWithKey:@"hr24time" ascending:YES],nil]];
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
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    if ([[device valueForKey:@"pillschedualstatus"] isEqualToString:@"delete"]) {
        //NSLog(@"not show");
        
    }
    else{
       // NSLog(@"show");
    

    
    // Configure the cell...
   
    [cell.name_dose setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"pill"]]];
    [cell.dose_lbl setText:[device valueForKey:@"dose"]];
    [cell.time setText:[device valueForKey:@"time"]];
    [cell.takentime setText:[device valueForKey:@"timetakentoday"]];

    
    // Date
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];         NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];
    
    //Time
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"H.mm"];
        TimeString = [dateFormat stringFromDate:[NSDate date]];
        

    
      
        if ([[device valueForKey:@"todaydate"] isEqualToString:convertedDateString] && [[device valueForKey:@"todaystatus"] isEqualToString:@"taken"])
    {
        NSLog(@"GREEN");
        [cell.dot setBackgroundColor:[UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0]];
       
     }
       else if ([[device valueForKey:@"hr24time"] floatValue]  < [TimeString floatValue] )
        {
            NSLog(@"data time %@",[device valueForKey:@"hr24time"]);
            NSLog(@"RED");
            [cell.dot setBackgroundColor:[UIColor redColor]];
        }

    else
    {
        NSLog(@"Blue");
        [cell.dot setBackgroundColor:[UIColor blueColor]];
    }
    
   
   
   // NSLog(@"today date %@",dateString);
    
    cell.dot.layer.cornerRadius = 5;
    cell.dot.layer.masksToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    if ([[device valueForKey:@"pillschedualstatus"] isEqualToString:@"delete"]) {
        return 0;
        
    }
    else{
       // NSLog(@"show");
        return 65;
    }
    
    
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state{
    if(state ==1){
        //current day
        
        NSDateFormatter* day = [[NSDateFormatter alloc] init];
        [day setDateFormat: @"EEEE"];
       
        
        // current time
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
        //new-------------------------------
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        // Define our table/entity to use
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cal"inManagedObjectContext:managedObjectContext];
        
        // Setup the fetch request
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entity];
        
        //          //  Define how we will sort the records
        //            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dose" ascending:NO];
        //            NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        //
        //            [request setSortDescriptors:sortDescriptors];
        
        // Fetch the records and handle an error
        NSError *Fetcherror;
        NSMutableArray *mutableFetchResults = [[managedObjectContext
                                                executeFetchRequest:request error:&Fetcherror] mutableCopy];
        
        if (!mutableFetchResults) {
            // Handle the error.
            // This is a serious error
        }
        
        
        //here usersNameTextField.text can be any (id) string that you are searching for
        TodayTableViewCell*cells = [self.tableView cellForRowAtIndexPath:indexPaths];
        if (([[mutableFetchResults valueForKey:@"pill"]
              containsObject:cells.name_dose.text]) && [[mutableFetchResults valueForKey:@"datetaken"]containsObject:convertedDateString] ){
            //Alert user or handle your duplicate methods from here
            NSLog(@"exist");
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!"message:@"Today already taken pill"
//        delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
//            [alert show];
        }
        else
        {
            NSLog(@"not exist");
            //new device
            NSManagedObjectContext *context = [self managedObjectContext];
            NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Cal" inManagedObjectContext:context];
            TodayTableViewCell*cells = [self.tableView cellForRowAtIndexPath:indexPaths];
            
            [newDevice setValue:cells.name_dose.text forKey:@"pill"];
            [newDevice setValue:cells.dose_lbl.text forKey:@"dose"];
            [newDevice setValue:cells.time.text forKey:@"time"];
            [newDevice setValue:[dateFormatter stringFromDate:now]  forKey:@"timetaken"];
            [newDevice setValue:convertedDateString  forKey:@"datetaken"];
            [newDevice setValue:[day stringFromDate:[NSDate date]]  forKey:@"day"];
            [newDevice setValue:@"taken" forKey:@"takenstatus"];
            
        }
        

        
        
        //update device
        NSManagedObject *selectedDevices = [self.devices objectAtIndex:[self.tableView indexPathForCell:cell].row];
        
        [selectedDevices setValue:[dateFormatter stringFromDate:now] forKeyPath:@"timetakentoday"];
        [selectedDevices setValue:@"taken" forKeyPath:@"todaystatus"];
        [selectedDevices setValue:convertedDateString forKeyPath:@"todaydate"];
        
        TodayTableViewCell*cell = [self.tableView cellForRowAtIndexPath:indexPaths];
        [cell.dot setBackgroundColor:[UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0]];
        [cell.takentime setText:[dateFormatter stringFromDate:now]];

        
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
