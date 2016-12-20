//
//  Calender.m
//  nemapp
//
//  Created by Ankur Kumawat on 19/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "Calender.h"
#import <CoreData/CoreData.h>

@interface Calender ()
{
    NSMutableArray*mutable_ary;
    NSMutableArray*pillname;
    NSString*pill;
    NSString *startdate;
}
@property (strong) NSMutableArray *devices;

@end

@implementation Calender
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    pillname = [[NSMutableArray alloc] init];
//    // Do any additional setup after loading the view.
//    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Add"];
//    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
//    
//    NSArray *info;  // this array contains your data
//    int counter=[self.devices count];
//    
//    NSMutableArray *name=[[NSMutableArray alloc] init];
//    for(int i=0;i<counter;i++)
//    {
//        NSDictionary *currentObject=[self.devices objectAtIndex:i];
//        startdate=[currentObject valueForKey:@"startdate"];
//        pill = [currentObject valueForKey:@"pill"];
//        
//        if ([[currentObject valueForKey:@"su"] isEqualToString:@"Sunday"]) {
//            
//            [name addObject:@"Sunday"];
//        }
//        if ([[currentObject valueForKey:@"m"] isEqualToString:@"Monday"])
//        {
//            [name addObject:@"Monday"];
//        }
//         if ([[currentObject valueForKey:@"tu"] isEqualToString:@"Tuesday"])
//        {
//            [name addObject:@"Tuesday"];
//        }
//      if ([[currentObject valueForKey:@"w"] isEqualToString:@"Wednesday"])
//        {
//            [name addObject:@"Wednesday"];
//        }
//        if ([[currentObject valueForKey:@"th"] isEqualToString:@"Thursday"])
//        {
//            [name addObject:@"Thursday"];
//        }
//        if ([[currentObject valueForKey:@"f"] isEqualToString:@"Friday"])
//        {
//            [name addObject:@"Friday"];
//        }
//        if ([[currentObject valueForKey:@"sa"] isEqualToString:@"Saturday"])
//        {
//            [name addObject:@"Saturday"];
//        }
//          //NSLog(@"days %@",name);
//        mutable_ary = [[NSMutableArray alloc]init];
//        
//            NSDateComponents *components;
//            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//            [dateFormat setDateFormat:@"dd-MM-yyyy"];
//        
//            NSDate *startDate = [dateFormat dateFromString:startdate];
//            NSDate *endDate = [dateFormat dateFromString:@"30-12-2016"];
//        
//            [dateFormat setDateFormat:@"dd-MM-yyyy, EEEE"];
//        
//            components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:startDate toDate:endDate options:0];
//        
//            long int days = [components day];
//        
//            for (int x = 0; x <= days; x++) {
//               // [mutable_ary addObject:[dateFormat stringFromDate:startDate]];
//                NSString*dates=[dateFormat stringFromDate:startDate];
//                NSString*name=pill;
//                NSString *combined = [NSString stringWithFormat:@"%@, %@", dates, name];
//                [mutable_ary addObject:combined];
//                
//                NSLog(@"%@",[dateFormat stringFromDate:startDate]);
//                
//                startDate = [startDate dateByAddingTimeInterval:(60 * 60 * 24)];
//                
//            }
//            NSLog(@"%@",mutable_ary);
//           // NSArray *loopAry = [[NSArray alloc]initWithObjects:@"Sunday",@"Monday",nil];
//        
//        
//            NSMutableArray *resultss = [[NSMutableArray alloc]init];
//            for (NSString *strData in  mutable_ary){
//                //2nd Loop for your weekdays array.By this you will get weekdays array in result.
//                for (NSString *strDay in name) {
//                    if ([strData containsString:strDay]) {
//                        [resultss addObject:strData];
//                    }
//                }
//                
//            }
//            
//            // print result
//            NSLog(@"%@",resultss);
//        long int counts=[resultss count];// resultss is a array list
//        for(int i=0;i<counts;i++)
//        {
//            NSArray*foos = [[resultss objectAtIndex:i] componentsSeparatedByString:@","];
//            NSString*date_name = [foos objectAtIndex:0];
//            NSString*day_name = [foos objectAtIndex:1];
//            NSString*name_name = [foos objectAtIndex:2];
//            NSLog(@"date_name %@",date_name);
//            NSLog(@"day_name %@",day_name);
//            NSLog(@"name_name %@",name_name);
//            //new device
//            NSManagedObjectContext *context = [self managedObjectContext];
//            NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Cal" inManagedObjectContext:context];
//            
//            [newDevice setValue:date_name forKey:@"datetaken"];
//            [newDevice setValue:day_name  forKey:@"day"];
//            [newDevice setValue:name_name forKey:@"pill"];
//            
//            
//            NSError *error = nil;
//            // Save the object to persistent store
//            
//            if (![context save:&error]) {
//                NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//            }
//            
//        }
//         [name removeAllObjects];
//
//    }
// 
//}

- (void) viewWillAppear:(BOOL)animated
{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Cal"
        inManagedObjectContext:managedObjectContext];
    
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //    // Define how we will sort the records
    //    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"pill"
    //                                                                   ascending:NO];
    //    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    //
    //    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle an error
    NSError *Fetcherror;
    NSMutableArray *mutableFetchResults = [[managedObjectContext
                                            executeFetchRequest:request error:&Fetcherror] mutableCopy];
    
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error
    }
   
    NSArray *info;  // this array contains your data
    int counter=[mutableFetchResults count];
    
    for(int i=0;i<counter;i++)
    {
        NSDictionary *currentObject=[mutableFetchResults objectAtIndex:i];
        
    //here usersNameTextField.text can be any (id) string that you are searching for
    if ([[mutableFetchResults valueForKey:@"pill"]
         containsObject: [currentObject valueForKey:@"pill"]]) {
        //Alert user or handle your duplicate methods from here
        NSLog(@"exist");
        return;
    }
    else
    {
        NSLog(@"not exist");
    }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
