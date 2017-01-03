//
//  CKDemoViewController.m
//  MBCalendarKit
//
//  Created by Moshe Berman on 4/17/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "CKDemoViewController.h"
#import "NSCalendarCategories.h"
#import "NSDate+Components.h"
#import <CoreData/CoreData.h>

@interface CKDemoViewController () <CKCalendarViewDelegate, CKCalendarViewDataSource, UINavigationControllerDelegate>
@property (nonatomic, strong) NSMutableDictionary *data;
@property (strong) NSMutableArray *caldevice;
@end

@implementation CKDemoViewController
@synthesize arr;
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Cal"];
    self.caldevice = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];

    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 600, 60)];
    [navbar  setBarTintColor:[UIColor orangeColor]];
    [navbar  setTranslucent:NO];
    navbar.tintColor = [UIColor whiteColor];
 
    
    //do something like background color, title, etc you self
    [self.view addSubview:navbar];
    
    
    UINavigationItem *item = [[UINavigationItem alloc]
                              init];
    navbar.items= @[item];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithImage:[UIImage imageNamed:@"4ByUK.png"]
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(backBtnClicked:)];
    
    item.leftBarButtonItem = backButton;
    
    

    self.data = [[NSMutableDictionary alloc] init];
    
   
    [self setDataSource:self];
    [self setDelegate:self];
    
   }
-(void)backBtnClicked:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) viewWillAppear: (BOOL)animated{
    
      NSArray *title = [_caldevice valueForKey:@"pill"];
   // NSLog(@"event name fetch %@",title);
    
    NSArray *date =[_caldevice valueForKey:@"datetaken"];
   // NSLog(@"event fetch %@",date);
    
    NSArray*dose= [_caldevice valueForKey:@"dose"];
    NSArray*image= [_caldevice valueForKey:@"takenstatus"];
   // NSLog(@"image %@",image);
    
    
    NSString *title1;
    NSString*title2;
    NSDate *date1;
    NSData *imgdata;
    CKCalendarEvent *releaseUpdatedCalendarKit;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
      dateFormatter.dateFormat = @"dd-MM-yyyy";
    
    
  
    for (int i = 0; i < [date count]; i++){
        title1 = NSLocalizedString(title[i], @"");
        title2 = NSLocalizedString(dose[i], @"");
        NSString *combined = [NSString stringWithFormat:@"%@ - %@", title1, title2];
        
        date1 = [dateFormatter dateFromString:date[i]];
        imgdata = image[i];
//        
//         NSLog(@"jhewrfh %@",imgdata);
       
        
        //releaseUpdatedCalendarKit = [CKCalendarEvent eventWithTitle:combined andDate:date1 andInfo:Nil];
       
       // NSLog(@"Event: %@ , %@",combined,date1);
        //releaseUpdatedCalendarKit = [CKCalendarEvent eventWithTitle:combined andDate:date1 andInfo:Nil andColor:Nil];
        
        NSData *dataImage = [[NSData alloc] init];
        dataImage = UIImagePNGRepresentation([UIImage imageNamed:@"Screen Shot 2016-12-21 at 5.19.52 PM.png"]);
       
        
        
        releaseUpdatedCalendarKit = [CKCalendarEvent eventWithTitle:combined andDate:date1 andInfo:Nil andImage:imgdata];

       
       // self.data[date1] = @[releaseUpdatedCalendarKit];
        if (self.data[date1]) {
            NSMutableArray *data = [NSMutableArray arrayWithArray:self.data[date1]];
            [data addObject:releaseUpdatedCalendarKit];
            self.data[date1] = data;
        } else {
            self.data[date1] = @[releaseUpdatedCalendarKit];
        }
        
    }
}

- (void)viewDidAppear:(BOOL)animated
{    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CKCalendarViewDataSource

- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date
{
    return [self data][date];
}

#pragma mark - CKCalendarViewDelegate

// Called before/after the selected date changes
- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date
{
    
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date
{
    
}


@end
