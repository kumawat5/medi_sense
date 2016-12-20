//
//  Setting.m
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "Setting.h"
#import <CoreData/CoreData.h>
#import "Calender.h"
#import "CKDemoViewController.h"


@interface Setting ()
{
    NSMutableArray*mutable_ary;
    NSMutableArray*pillname;
    NSString*pill;
    NSString *startdate;
    NSString*doses;
    NSString*times;
    
    NSString *title1;
    NSString *title2;
    
    
}
@property (strong) NSMutableArray *devices;

@property (strong) NSMutableArray *caldevice;


@end

@implementation Setting
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
    pillname = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSArray *info;  // this array contains your data
    int counter=[self.devices count];
    
    NSMutableArray *name=[[NSMutableArray alloc] init];
    for(int i=0;i<counter;i++)
    {
        NSDictionary *currentObject=[self.devices objectAtIndex:i];
        startdate=[currentObject valueForKey:@"startdate"];
        pill = [currentObject valueForKey:@"pill"];
        doses = [currentObject valueForKey:@"dose"];
        times=[currentObject valueForKey:@"time"];
        
        if ([[currentObject valueForKey:@"su"] isEqualToString:@"Sunday"]) {
            
            [name addObject:@"Sunday"];
        }
        if ([[currentObject valueForKey:@"m"] isEqualToString:@"Monday"])
        {
            [name addObject:@"Monday"];
        }
        if ([[currentObject valueForKey:@"tu"] isEqualToString:@"Tuesday"])
        {
            [name addObject:@"Tuesday"];
        }
        if ([[currentObject valueForKey:@"w"] isEqualToString:@"Wednesday"])
        {
            [name addObject:@"Wednesday"];
        }
        if ([[currentObject valueForKey:@"th"] isEqualToString:@"Thursday"])
        {
            [name addObject:@"Thursday"];
        }
        if ([[currentObject valueForKey:@"f"] isEqualToString:@"Friday"])
        {
            [name addObject:@"Friday"];
        }
        if ([[currentObject valueForKey:@"sa"] isEqualToString:@"Saturday"])
        {
            [name addObject:@"Saturday"];
        }
        //NSLog(@"days %@",name);
        mutable_ary = [[NSMutableArray alloc]init];
        
        NSDateComponents *components;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd-MM-yyyy"];
        
        NSDate *startDate = [dateFormat dateFromString:startdate];
        NSDate *endDate = [dateFormat dateFromString:@"30-12-2016"];
        
        [dateFormat setDateFormat:@"dd-MM-yyyy, EEEE"];
        
        components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:startDate toDate:endDate options:0];
        
        long int days = [components day];
        
        for (int x = 0; x <= days; x++) {
            // [mutable_ary addObject:[dateFormat stringFromDate:startDate]];
            NSString*dates=[dateFormat stringFromDate:startDate];
            NSString*name=pill;
            NSString*dosename= doses;
            NSString*timepill=times;
            NSString *combined = [NSString stringWithFormat:@"%@,%@,%@,%@", dates, name, dosename, timepill];
            [mutable_ary addObject:combined];
            
            //NSLog(@"%@",[dateFormat stringFromDate:startDate]);
            
            startDate = [startDate dateByAddingTimeInterval:(60 * 60 * 24)];
            
        }
        // NSLog(@"%@",mutable_ary);
        
        // NSArray *loopAry = [[NSArray alloc]initWithObjects:@"Sunday",@"Monday",nil];
        
        
        NSMutableArray *resultss = [[NSMutableArray alloc]init];
        for (NSString *strData in  mutable_ary){
            //2nd Loop for your weekdays array.By this you will get weekdays array in result.
            for (NSString *strDay in name) {
                if ([strData containsString:strDay]) {
                    [resultss addObject:strData];
                }
            }
            
        }
        
        // print result
        NSLog(@"%@",resultss);
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
        long int counts=[resultss count];// resultss is a array list
        for(int i=0;i<counts;i++)
        {
            NSArray*foos = [[resultss objectAtIndex:i] componentsSeparatedByString:@","];
            NSString*date_name = [foos objectAtIndex:0];
            NSString*day_name = [foos objectAtIndex:1];
            NSString*name_name = [foos objectAtIndex:2];
            NSString*dose_name = [foos objectAtIndex:3];
            NSString*time_name = [foos objectAtIndex:4];
            
           // NSLog(@"hgbhggh %@",name_name);
            
            
            //here usersNameTextField.text can be any (id) string that you are searching for
            if (([[mutableFetchResults valueForKey:@"pill"]
                  containsObject:name_name]) && [[mutableFetchResults valueForKey:@"datetaken"]containsObject:date_name] ){
                //Alert user or handle your duplicate methods from here
                NSLog(@"exist");
                // return;
            }
            else
            {
                NSLog(@"not exist");
                //new device
                NSManagedObjectContext *context = [self managedObjectContext];
                NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Cal" inManagedObjectContext:context];
                
                [newDevice setValue:date_name forKey:@"datetaken"];
                [newDevice setValue:day_name  forKey:@"day"];
                [newDevice setValue:name_name forKey:@"pill"];
                [newDevice setValue:dose_name forKey:@"dose"];
                [newDevice setValue:time_name forKey:@"time"];
                
                
                
                NSError *error = nil;
                // Save the object to persistent store
                
                if (![context save:&error]) {
                    NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
                }
                
            }
        }
        
        [name removeAllObjects];
        
    }

    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }
    else if(section==1){
        return 2;}
    else if(section==2){
        return 1;}
    else if(section==3){
        return 1;}
    else
        return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"  ";
    }
    else if(section==1){
        headerTitle = @"  ";
        
    }
    else if(section==2){
        headerTitle =@"  ";
    }
    else if(section==3){
        headerTitle =@"  ";
    }
    else
    {
        headerTitle =@"  ";
    }
    
    return headerTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell"];
  
    if (indexPath.section==0) {
            if (indexPath.row == 0) {
        UITableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell1"];
        return cell1;
        }
        else if (indexPath.row==1){
            UITableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell2"];
        return cell2;
        }
        else if (indexPath.row==2){
            UITableViewCell * cell3 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell3"];
            return cell3;
        }
    
    }
    else if (indexPath.section==1)
    {
     if (indexPath.row ==0) {
            UITableViewCell * cell4 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell4"];
            return cell4;
        }
        else
            if (indexPath.row==1) {
                UITableViewCell * cell5 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell5"];
                
                return cell5;
            }

    }
    else if (indexPath.section ==2)
    {
        if (indexPath.row==0) {
            UITableViewCell * cell6 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell6"];
            return cell6;
        
        }
            }
    else if (indexPath.section ==3)
    {
        if (indexPath.row==0) {
            UITableViewCell * cell7 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell7"];
            return cell7;
            
        }
    }
    else if (indexPath.section ==4)
    {
        if (indexPath.row==0) {
            
            return cell;
        }

    }

   return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==4) {
        if (indexPath.row==0) {
            return 200;
        }
    }
    
    
    return 50;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
    {

    if (indexPath.row==1) {
       // UITableViewCell * cell5 = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell5"];
        
        //return cell5;
        
        CKDemoViewController *destVC = [[CKDemoViewController alloc] init];
       // destVC.arr = title;
        [self presentViewController:destVC animated:YES completion:nil];
    }
    }

    
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"UpdateDevice"]) {
//        Calender *secondVC = (Calender* ) segue.destinationViewController;
//        secondVC.device = [NSMutableArray arrayWithArray:self.caldevice]; // it is a good practice to initiate the property first
//
//        
//    }
//}


@end
