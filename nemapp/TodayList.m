//
//  TodayList.m
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "TodayList.h"
#import "MCSwipeTableViewCell.h"
static NSUInteger const kMCNumItems = 7;



@interface TodayList ()<MCSwipeTableViewCellDelegate, UIAlertViewDelegate>

{
    NSMutableArray *patterns;
    NSMutableArray *patternImages;
    NSMutableArray*mutable_ary;
    NSString *TimeString;
}

@property (strong) NSMutableArray *devices;
@property (strong) NSMutableArray *dev;
@property (nonatomic, assign) NSUInteger nbItems;
@property (nonatomic, strong) MCSwipeTableViewCell *cellToDelete;

@end

@implementation TodayList
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        _nbItems = kMCNumItems;
    }
    return self;
}

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
   
    
   
   //---------------------------------------------------------//
    
   //all notification NSLog---------
    //NSLog(@"scheduled notifications: --%@----", [[UIApplication sharedApplication] scheduledLocalNotifications]);
    
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
    NSInteger numOfSections = 0;
    if ([self.devices count] > 0)
    {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        numOfSections                 = 1;
        //yourTableView.backgroundView   = nil;
        self.tableView.backgroundView = nil;
    }
    else
    {
        UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
        noDataLabel.text = @"Click on the + to get started";
        noDataLabel.textColor        = [UIColor lightGrayColor];
        noDataLabel.textAlignment    = NSTextAlignmentCenter;
        //yourTableView.backgroundView = noDataLabel;
        //yourTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundView = noDataLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return numOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.devices.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    MCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[MCSwipeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        // iOS 7 separator
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];

    return cell;
    
}
#pragma mark - UITableViewDataSource

- (void)configureCell:(MCSwipeTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *checkView = [self viewWithImageName:@"check.png"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];
    
    //    UIView *crossView = [self viewWithImageName:@"cross"];
    //    UIColor *redColor = [UIColor colorWithRed:232.0 / 255.0 green:61.0 / 255.0 blue:14.0 / 255.0 alpha:1.0];
    
    UIView *clockView = [self viewWithImageName:@"cross.png"];
    UIColor *yellowColor = [UIColor colorWithRed:254.0 / 255.0 green:217.0 / 255.0 blue:56.0 / 255.0 alpha:1.0];
    
    //    UIView *listView = [self viewWithImageName:@"list"];
    //    UIColor *brownColor = [UIColor colorWithRed:206.0 / 255.0 green:149.0 / 255.0 blue:98.0 / 255.0 alpha:1.0];
    
    // Setting the default inactive state color to the tableView background color
    [cell setDefaultColor:self.tableView.backgroundView.backgroundColor];
    
    [cell setDelegate:self];
    
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    if ([[device valueForKey:@"pillschedualstatus"] isEqualToString:@"delete"]) {
        //NSLog(@"not show");
        
    }
    
     else{
    for(int i=0;i<self.devices.count;i++)
    {
        // Date
        NSDate *todayDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];
        
        //Time
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"H.mm"];
        TimeString = [dateFormat stringFromDate:[NSDate date]];
        

       
        
        
        if (indexPath.row % kMCNumItems == i) {
            if ([[device valueForKey:@"todaydate"] isEqualToString:convertedDateString] && [[device valueForKey:@"todaystatus"] isEqualToString:@"taken"])
            {
                [cell.name_dose setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"pill"]]];
                [cell.dose_lbl setText:[device valueForKey:@"dose"]];
                [cell.time setText:[device valueForKey:@"time"]];
                [cell.takentime setText:[device valueForKey:@"timetakentoday"]];
                
                cell.dot.layer.cornerRadius = 5;
                cell.dot.layer.masksToBounds = YES;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            else
            {
            
            [cell.name_dose setText:[NSString stringWithFormat:@"%@", [device valueForKey:@"pill"]]];
            [cell.dose_lbl setText:[device valueForKey:@"dose"]];
            [cell.time setText:[device valueForKey:@"time"]];
            //[cell.takentime setText:[device valueForKey:@"timetakentoday"]];
            
            cell.dot.layer.cornerRadius = 5;
            cell.dot.layer.masksToBounds = YES;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            }
            
            
            
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

            
            [cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
                NSLog(@"Did swipe \"Checkmark 1\" cell");
                NSLog(@"uhsfigh %ld", (long)indexPath.row);
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
                //-------------------------//
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
                MCSwipeTableViewCell*cells = [self.tableView cellForRowAtIndexPath:indexPaths];
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
                    MCSwipeTableViewCell*cells = [self.tableView cellForRowAtIndexPath:indexPaths];
                    
                    [newDevice setValue:cells.name_dose.text forKey:@"pill"];
                    [newDevice setValue:cells.dose_lbl.text forKey:@"dose"];
                    [newDevice setValue:cells.time.text forKey:@"time"];
                    [newDevice setValue:[dateFormatter stringFromDate:now]  forKey:@"timetaken"];
                    [newDevice setValue:convertedDateString  forKey:@"datetaken"];
                    [newDevice setValue:[day stringFromDate:[NSDate date]]  forKey:@"day"];
                    // [newDevice setValue:@"taken" forKey:@"takenstatus"];
                    
                }
                //update device
                NSManagedObject *selectedDevices = [self.devices objectAtIndex:[self.tableView indexPathForCell:cell].row];
                
                [selectedDevices setValue:[dateFormatter stringFromDate:now] forKeyPath:@"timetakentoday"];
                [selectedDevices setValue:@"taken" forKeyPath:@"todaystatus"];
                [selectedDevices setValue:convertedDateString forKeyPath:@"todaydate"];
                MCSwipeTableViewCell*cella = [self.tableView cellForRowAtIndexPath:indexPaths];
                [cella.dot setBackgroundColor:[UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0]];
                [cella.takentime setText:[dateFormatter stringFromDate:now]];
                
                
                NSError *saveError = nil;
                [self.managedObjectContext save:&saveError];
                if (saveError)
                {
                    
                }
                else
                {
                    
                    
                }
                
                //update cal
                NSManagedObjectContext *managedObjectContextcal = [self managedObjectContext];
                NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Cal"];
                //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
                //  NSIndexPath *indexPathcal = [self.tableView indexPathForCell:cell];
                MCSwipeTableViewCell*cellcal = [self.tableView cellForRowAtIndexPath:indexPaths];
                fetchRequest.predicate = [NSPredicate predicateWithFormat: @ "(datetaken == %@) && (pill == %@)", convertedDateString ,cellcal.name_dose.text];
                _dev = [managedObjectContextcal executeFetchRequest:fetchRequest error:nil];
                for (NSManagedObject *obj in _dev) {
                    NSData *dataImage = [[NSData alloc] init];
                    dataImage = UIImagePNGRepresentation([UIImage imageNamed:@"Screen Shot 2016-12-21 at 5.18.55 PM.png"]);
                    [obj setValue:dataImage forKey:@"takenstatus"];
                    
                }
                NSError *error = nil;
                // Save the object to persistent store
                if (![managedObjectContextcal save:&error]) {
                    NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
                }
                
            
            }];
            
            //        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState2 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            //            NSLog(@"Did swipe \"Cross\" cell");
            //        }];
            
            [cell setSwipeGestureWithView:clockView color:yellowColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState3 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
                NSLog(@"Did swipe \"Clock\" cell");
                NSLog(@"uhsfigh %ld", (long)indexPath.row);
                NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
                MCSwipeTableViewCell*cells = [self.tableView cellForRowAtIndexPath:cellIndexPath];
                NSLog(@"ankur%@",cells.name_dose.text);
                NSManagedObject *selectedDevices = [self.devices objectAtIndex:[self.tableView indexPathForCell:cell].row];
                
                [selectedDevices setValue:@"" forKeyPath:@"timetakentoday"];
                [selectedDevices setValue:@"" forKeyPath:@"todaystatus"];
                [selectedDevices setValue:@"" forKeyPath:@"todaydate"];
                MCSwipeTableViewCell*cella = [self.tableView cellForRowAtIndexPath:cellIndexPath];
                [cella.dot setBackgroundColor:[UIColor redColor]];
                [cella.takentime setText:@""];
                
                
                NSError *saveError = nil;
                [self.managedObjectContext save:&saveError];
                if (saveError)
                {
                    
                }
                else
                {
                    
                    
                }
                
                //update cal
                
                 NSIndexPath *indexPaths = [self.tableView indexPathForCell:cell];
                NSManagedObjectContext *managedObjectContextcal = [self managedObjectContext];
                NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Cal"];
                //    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
                //  NSIndexPath *indexPathcal = [self.tableView indexPathForCell:cell];
                MCSwipeTableViewCell*cellcal = [self.tableView cellForRowAtIndexPath:indexPaths];
                fetchRequest.predicate = [NSPredicate predicateWithFormat: @ "(datetaken == %@) && (pill == %@)", convertedDateString ,cellcal.name_dose.text];
                _dev = [managedObjectContextcal executeFetchRequest:fetchRequest error:nil];
                 NSError *error = nil;
                if (!error && _dev.count > 0) {
                    for(NSManagedObject *managedObject in _dev){
                        [managedObjectContextcal deleteObject:managedObject];
                    }
                    
                    //Save context to write to store
                    [managedObjectContextcal save:nil];
                }

            }];
            
            //        [cell setSwipeGestureWithView:listView color:brownColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState4 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            //            NSLog(@"Did swipe \"List\" cell");
            //        }];
        }
    }
    
}
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

#pragma mark - MCSwipeTableViewCellDelegate


// When the user starts swiping the cell this method is called
- (void)swipeTableViewCellDidStartSwiping:(MCSwipeTableViewCell *)cell {
    //  NSLog(@"Did start swiping the cell!");
}

// When the user ends swiping the cell this method is called
- (void)swipeTableViewCellDidEndSwiping:(MCSwipeTableViewCell *)cell {
    //  NSLog(@"Did end swiping the cell!");
}

// When the user is dragging, this method is called and return the dragged percentage from the border
- (void)swipeTableViewCell:(MCSwipeTableViewCell *)cell didSwipeWithPercentage:(CGFloat)percentage {
    // NSLog(@"Did swipe with percentage : %f", percentage);
}

#pragma mark - Utils

- (void)reload:(id)sender {
    _nbItems = kMCNumItems;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)deleteCell:(MCSwipeTableViewCell *)cell {
    NSParameterAssert(cell);
    
    _nbItems--;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // No
    if (buttonIndex == 0) {
        [_cellToDelete swipeToOriginWithCompletion:^{
            NSLog(@"Swiped back");
        }];
        _cellToDelete = nil;
    }
    
    // Yes
    else {
        _nbItems--;
        [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:_cellToDelete]] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
//    switch (index) {
//        case 0:
//        {
//          
//             NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
//            TodayTableViewCell*cells = [self.tableView cellForRowAtIndexPath:cellIndexPath];
//            NSLog(@"ankur%@",cells.name_dose.text);
//            break;
//        }
//                default:
//            break;
//    }
//}




@end
