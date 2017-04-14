//
//  Add.m
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "Add.h"
#import "mg_cell.h"
#import "TodayList.h"



@interface Add ()
{
    NSString*monday;
    NSString*tuesday;
    NSString*wednesday;
    NSString*thursday;
    NSString*friday;
    NSString*saturday;
    NSString*sunday;
    NSString *hr24time;
    NSMutableArray*notidat;
    int hr;
    int min;
    NSString *combined;
    NSMutableArray*oldnotiday;
    NSString*oldcombined;
    int oldhr;
    int oldmin;
    NSArray*mg_ary;
    
    NSString*pill;
    NSString*dose;
    NSString*mg;
    NSString*time;
    
}
@property (weak, nonatomic) IBOutlet UIButton *sun_btn;
@property (weak, nonatomic) IBOutlet UIButton *mon_btn;
@property (weak, nonatomic) IBOutlet UIButton *tue_btn;
@property (weak, nonatomic) IBOutlet UIButton *wed_btn;
@property (weak, nonatomic) IBOutlet UIButton *th_btn;
@property (weak, nonatomic) IBOutlet UIButton *fri_btn;
@property (weak, nonatomic) IBOutlet UIButton *sat_btn;


@end

@implementation Add
@synthesize device;

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
    
    
    
    oldnotiday=[[NSMutableArray alloc]init];
    notidat = [[NSMutableArray alloc]init];
    //-----------------------------------------------//
    self.mg_table.hidden=YES;
    mg_ary= [[NSArray alloc]initWithObjects:@"mg",@"g",@"tablespoon", nil];
    self.mg_table.layer.borderColor = [UIColor blackColor].CGColor;
    self.mg_table.layer.borderWidth = 1;
    self.mg_table.layer.cornerRadius = 5;
    
    //------------------------------------------------//
    if (self.device) {
//        oldcombined = [NSString stringWithFormat:@"%@ - %@", [self.device valueForKey:@"pill"], [self.device valueForKey:@"dose"]];
//        NSArray*old = [[device valueForKey:@"hr24time"] componentsSeparatedByString:@"."];
//        oldhr = [[old objectAtIndex:0] intValue];
//        oldmin = [[old objectAtIndex:1] intValue];
//        //delete noti-----------------------------------------//
//        NSArray *arrayOfLocalNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications] ;
//        for (UILocalNotification *localNotification in arrayOfLocalNotifications) {
//            
//            if ([localNotification.alertBody isEqualToString:oldcombined]) {
//                NSLog(@"the notification this is canceld is %@", localNotification.alertBody);
//                
//                [[UIApplication sharedApplication] cancelLocalNotification:localNotification] ; // delete the notification from the system
//                
//            }
//            
//        }

                //-------------------------------------------------//

        

        [self.tx_pillname setText:[self.device valueForKey:@"pill"]];
       // [self.tx_dose setText:[self.device valueForKey:@"dose"]];
        NSArray*foos = [[self.device valueForKey:@"dose"] componentsSeparatedByString:@" "];
        NSLog(@"=== === %@",foos);
        NSString*dose_mg = [foos objectAtIndex:0];
        NSString*mg_mg = [foos objectAtIndex:2];
        NSLog(@"==== %@",mg_mg);
        
        [self.tx_dose setText:dose_mg];
        [self.tx_mg setText:mg_mg];
        
        pill = _tx_pillname.text;
        NSLog(@"pill== %@",pill);
        dose = _tx_dose.text;
        NSLog(@"pill_dose== %@",dose);
        mg = _tx_mg.text;
        NSLog(@"pill_mg== %@",mg);
        time = _tx_time.text;
        NSLog(@"pill_time== %@",time);

      
        
        [self.tx_time setText:[self.device valueForKey:@"time"]];
        if ([[self.device valueForKey:@"su"] isEqualToString:@"Sunday"]) {
            if ([_sun_btn isSelected]) {
                [_sun_btn setSelected: NO];
               // NSLog(@"selected");
                self.sun_btn.backgroundColor = [UIColor clearColor];
                sunday = @"nil";
            } else {
                [_sun_btn setSelected: YES];
               // NSLog(@"deselected");
                self.sun_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
                _sun_btn.tintColor=[UIColor clearColor];
                sunday = @"Sunday";
                [oldnotiday addObject:@"1"];
            }


        }
        if ([[self.device valueForKey:@"m"] isEqualToString:@"Monday"]) {
            
            if ([_mon_btn isSelected]) {
                [_mon_btn setSelected: NO];
                //NSLog(@"selected");
                self.mon_btn.backgroundColor = [UIColor clearColor];
                monday = @"nil";
            } else {
                [_mon_btn setSelected: YES];
                //NSLog(@"deselected");
                self.mon_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
                _mon_btn.tintColor=[UIColor clearColor];
                monday = @"Monday";
                [oldnotiday addObject:@"2"];
                
            }
        }
        if ([[self.device valueForKey:@"tu"] isEqualToString:@"Tuesday"]) {
            
            if ([_tue_btn isSelected]) {
                [_tue_btn setSelected: NO];
               // NSLog(@"selected");
                self.tue_btn.backgroundColor = [UIColor clearColor];
                tuesday = @"nil";
            } else {
                [_tue_btn setSelected: YES];
               // NSLog(@"deselected");
                self.tue_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
                _tue_btn.tintColor=[UIColor clearColor];
                tuesday = @"Tuesday";
                [oldnotiday addObject:@"3"];
                
            }

        }
        if ([[self.device valueForKey:@"w"] isEqualToString:@"Wednesday"]) {
            if ([_wed_btn isSelected]) {
              [_wed_btn setSelected: NO];
              // NSLog(@"selected");
               self.wed_btn.backgroundColor = [UIColor clearColor];
            wednesday = @"nil";
            } else {
               [_wed_btn setSelected: YES];
              // NSLog(@"deselected");
               self.wed_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
               _wed_btn.tintColor=[UIColor clearColor];
            wednesday = @"Wednesday";
                [oldnotiday addObject:@"4"];
            
        }
    }
        if ([[self.device valueForKey:@"th"] isEqualToString:@"Thursday"]) {
            if ([_th_btn isSelected]) {
                [_th_btn setSelected: NO];
                //NSLog(@"selected");
                self.th_btn.backgroundColor = [UIColor clearColor];
                thursday = @"nil";
            } else {
                [_th_btn setSelected: YES];
                //NSLog(@"deselected");
                self.th_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
                _th_btn.tintColor=[UIColor clearColor];
                thursday = @"Thursday";
                [oldnotiday addObject:@"5"];
                
            }

            
        }
         if ([[self.device valueForKey:@"f"] isEqualToString:@"Friday"]) {
             if ([_fri_btn isSelected]) {
                 [_fri_btn setSelected: NO];
                 //NSLog(@"selected");
                 self.fri_btn.backgroundColor = [UIColor clearColor];
                 friday = @"nil";
             } else {
                 [_fri_btn setSelected: YES];
                 //NSLog(@"deselected");
                 self.fri_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
                 _fri_btn.tintColor=[UIColor clearColor];
                 friday = @"Friday";
                 [oldnotiday addObject:@"6"];
                 
             }
         }
         if ([[self.device valueForKey:@"sa"] isEqualToString:@"Saturday"]) {
             if ([_sat_btn isSelected]) {
                 [_sat_btn setSelected: NO];
                 //NSLog(@"selected");
                 self.sat_btn.backgroundColor = [UIColor clearColor];
                 saturday = @"nil";
             } else {
                 [_sat_btn setSelected: YES];
                 //NSLog(@"deselected");
                 self.sat_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
                 _sat_btn.tintColor=[UIColor clearColor];
                 saturday = @"Saturday";
                 [oldnotiday addObject:@"7"];
                 
             }

         }
       
        

    }

    // Do any additional setup after loading the view.
     _sun_btn.layer.cornerRadius = 7;
    _sun_btn.layer.masksToBounds = YES;
    [[_sun_btn layer] setBorderWidth:2.0f];
    [[_sun_btn layer] setBorderColor:[UIColor blueColor].CGColor];
   
    
    _mon_btn.layer.cornerRadius = 7;
   _mon_btn.layer.masksToBounds = YES;
    [[_mon_btn layer] setBorderWidth:2.0f];
    [[_mon_btn layer] setBorderColor:[UIColor blueColor].CGColor];
    
    _tue_btn.layer.cornerRadius = 7;
    _tue_btn.layer.masksToBounds = YES;
    [[_tue_btn layer] setBorderWidth:2.0f];
    [[_tue_btn layer] setBorderColor:[UIColor blueColor].CGColor];

    
    _wed_btn.layer.cornerRadius = 7;
    _wed_btn.layer.masksToBounds = YES;
    [[_wed_btn layer] setBorderWidth:2.0f];
    [[_wed_btn layer] setBorderColor:[UIColor blueColor].CGColor];
    
    _th_btn.layer.cornerRadius = 7;
    _th_btn.layer.masksToBounds = YES;
    [[_th_btn layer] setBorderWidth:2.0f];
    [[_th_btn layer] setBorderColor:[UIColor blueColor].CGColor];
    
    _fri_btn.layer.cornerRadius = 7;
    _fri_btn.layer.masksToBounds = YES;
    [[_fri_btn layer] setBorderWidth:2.0f];
    [[_fri_btn layer] setBorderColor:[UIColor blueColor].CGColor];
    
    _sat_btn.layer.cornerRadius = 7;
    _sat_btn.layer.masksToBounds = YES;
    [[_sat_btn layer] setBorderWidth:2.0f];
    [[_sat_btn layer] setBorderColor:[UIColor blueColor].CGColor];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeTime;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [_tx_time setInputView:datePicker];
    
    
   

}
//-(void) viewWillDisappear:(BOOL)animated
//{
//    
//   // NSLog(@"nslog %@",oldcombined);
//    //NSLog(@"notiday %@",oldnotiday);
//   // NSLog(@"hr %d",oldhr);
//   // NSLog(@"min %d",oldmin);
//   long int counter=oldnotiday.count;
//    
//    for(int i=0;i<counter;i++)
//    {
//       long int k =[[oldnotiday objectAtIndex:i]integerValue];
//        
//        
//       // NSLog(@"array %ld",k);
//        
//        
//        NSDate *nows = [NSDate date];
//        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//        
//        // Extract date components into components1
//        NSDateComponents *components1 = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:nows];
//        components1.weekday = k;//Monday
//        components1.hour = hr;
//        components1.minute=min;
//        NSDate *fireDates = [gregorianCalendar dateFromComponents:components1];
//        
//        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//        localNotification.fireDate = fireDates;
//        localNotification.alertBody = oldcombined;
//        localNotification.alertTitle =@"Please take your medication";
//        localNotification.soundName = @"oh-really.caf";
//        
//        localNotification.applicationIconBadgeNumber = 1;
//        //localNotification.applicationIconBadgeNumber++;
//        localNotification.repeatInterval = NSWeekCalendarUnit;
//        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//        NSLog(@"notification: %@",localNotification);
//    }
//
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)_tx_time.inputView;
    //[picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"h:mm a"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _tx_time.text = [NSString stringWithFormat:@"%@",dateString];
    
     NSDateFormatter *Format = [[NSDateFormatter alloc] init];
    NSDate*date = picker.date;
    [Format setDateFormat:@"H.mm"];
    hr24time = [Format stringFromDate:date];
    
     NSArray*foos = [hr24time componentsSeparatedByString:@"."];
    hr = [[foos objectAtIndex:0] intValue];
    min = [[foos objectAtIndex:1] intValue];
   
}


-(IBAction)action:(id)sender{
    
    UIButton *button=(UIButton*)sender;
    
    if(button.tag==1){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            //NSLog(@"selected");
             self.sun_btn.backgroundColor = [UIColor clearColor];
            sunday = @"nil";
            [notidat removeObject:@"1"];
            [oldnotiday removeObject:@"1"];
           
        } else {
            [sender setSelected: YES];
            // NSLog(@"deselected");
            self.sun_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _sun_btn.tintColor=[UIColor clearColor];
            sunday = @"Sunday";
            
            [notidat addObject:@"1"];
            [oldnotiday addObject:@"1"];
           
            
        }
    }
    if(button.tag==2){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            //NSLog(@"selected");
            self.mon_btn.backgroundColor = [UIColor clearColor];
            monday = @"nil";
            [notidat removeObject:@"2"];
            [oldnotiday removeObject:@"2"];
           
        } else {
            [sender setSelected: YES];
           // NSLog(@"deselected");
            self.mon_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _mon_btn.tintColor=[UIColor clearColor];
            monday = @"Monday";
            
            [notidat addObject:@"2"];
            [oldnotiday addObject:@"2"];
           
            
        }
   

    }
    if(button.tag==3){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
           // NSLog(@"selected");
            self.tue_btn.backgroundColor = [UIColor clearColor];
            tuesday = @"nil";
             [notidat removeObject:@"3"];
            [oldnotiday removeObject:@"3"];

        } else {
            [sender setSelected: YES];
          //  NSLog(@"deselected");
            self.tue_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _tue_btn.tintColor=[UIColor clearColor];
            tuesday = @"Tuesday";
             [notidat addObject:@"3"];
            [oldnotiday addObject:@"3"];
            
        }

    }
    if(button.tag==4){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
           // NSLog(@"selected");
            self.wed_btn.backgroundColor = [UIColor clearColor];
            wednesday = @"nil";
             [notidat removeObject:@"4"];
            [oldnotiday removeObject:@"4"];
        } else {
            [sender setSelected: YES];
            //NSLog(@"deselected");
            self.wed_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _wed_btn.tintColor=[UIColor clearColor];
            wednesday = @"Wednesday";
             [notidat addObject:@"4"];
            [oldnotiday addObject:@"4"];
            
        }
    }
    if(button.tag==5){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            //NSLog(@"selected");
            self.th_btn.backgroundColor = [UIColor clearColor];
            thursday = @"nil";
             [notidat removeObject:@"5"];
            [oldnotiday removeObject:@"5"];
        } else {
            [sender setSelected: YES];
           // NSLog(@"deselected");
            self.th_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _th_btn.tintColor=[UIColor clearColor];
            thursday = @"Thursday";
             [notidat addObject:@"5"];
            [oldnotiday addObject:@"5"];
            
        }

    }
    if(button.tag==6){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            //NSLog(@"selected");
            self.fri_btn.backgroundColor = [UIColor clearColor];
            friday = @"nil";
             [notidat removeObject:@"6"];
            [oldnotiday removeObject:@"6"];
        } else {
            [sender setSelected: YES];
            //NSLog(@"deselected");
            self.fri_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _fri_btn.tintColor=[UIColor clearColor];
            friday = @"Friday";
             [notidat addObject:@"6"];
            [oldnotiday addObject:@"6"];
            
        }

    }
    if(button.tag==7){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            //NSLog(@"selected");
            self.sat_btn.backgroundColor = [UIColor clearColor];
            saturday = @"nil";
             [notidat removeObject:@"7"];
            [oldnotiday removeObject:@"7"];
        } else {
            [sender setSelected: YES];
            //NSLog(@"deselected");
            self.sat_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _sat_btn.tintColor=[UIColor clearColor];
            saturday = @"Saturday";
             [notidat addObject:@"7"];
            [oldnotiday addObject:@"7"];
        }
    }
    
}

- (IBAction)save:(id)sender {
    if (![self isFormValid]) {
        
        return;
        
    }
    
    NSError *error;
    
    
    if (!error)
    {
        

    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        
        NSString * combinedss = [NSString stringWithFormat:@"%@ - %@  %@", pill, dose, mg];
        NSArray *arrayOfLocalNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications] ;
        for (UILocalNotification *localNotification in arrayOfLocalNotifications) {
            
            if ([localNotification.alertBody isEqualToString:combinedss]) {
                NSLog(@"the notification this is canceld is %@", localNotification.alertBody);
                
                [[UIApplication sharedApplication] cancelLocalNotification:localNotification] ; // delete the notification from the system
                NSLog(@"1st call");
                
            }
            
        }
        

        // Update existing device
        NSLog(@"// Update existing device");
        [self.device setValue:self.tx_pillname.text forKey:@"pill"];
        NSString *combineds = [NSString stringWithFormat:@"%@  %@", self.tx_dose.text, self.tx_mg.text];
        [self.device setValue:combineds forKey:@"dose"];
        [self.device setValue:self.tx_time.text forKey:@"time"];
         [self.device setValue:sunday forKey:@"su"];
        [self.device setValue:monday forKey:@"m"];
        [self.device setValue:tuesday forKey:@"tu"];
        [self.device setValue:wednesday forKey:@"w"];
        [self.device setValue:thursday forKey:@"th"];
        [self.device setValue:friday forKey:@"f"];
        [self.device setValue:saturday forKey:@"sa"];
        
//        NSString*pills = _tx_pillname.text;
//        NSLog(@"pill== %@",pills);
//        NSString*doses = _tx_dose.text;
//        NSLog(@"pill== %@",doses);
//        NSString*mgs = _tx_mg.text;
//        NSLog(@"pill== %@",mgs);
//        NSString*times = _tx_time.text;
//        NSLog(@"pill== %@",times);
        NSLog(@"2 nd call");
        combined = [NSString stringWithFormat:@"%@ - %@  %@", self.tx_pillname.text, self.tx_dose.text, self.tx_mg.text];

        long int counter=oldnotiday.count;
        
        for(int i=0;i<counter;i++)
        {
            long int j =[[oldnotiday objectAtIndex:i]integerValue];
            
            
            //  NSLog(@"array %ld",j);
            
            
            NSDate *nows = [NSDate date];
            NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            
            // Extract date components into components1
            NSDateComponents *components1 = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:nows];
            components1.weekday = j;//Monday
            components1.hour = hr;
            components1.minute=min;
            NSDate *fireDates = [gregorianCalendar dateFromComponents:components1];
            
            
            UILocalNotification *localNotification = [[UILocalNotification alloc] init];
            localNotification.fireDate = fireDates;
            [localNotification setTimeZone:[NSTimeZone  localTimeZone]];
            localNotification.alertBody = combined;
            localNotification.alertTitle =@"Please take your medication";
            localNotification.soundName = @"oh-really.caf";
            
            
            //localNotification.applicationIconBadgeNumber = +1;
            localNotification.applicationIconBadgeNumber++;
            
            NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"key", nil];
            localNotification.userInfo = infoDict;
            
            
            localNotification.repeatInterval = NSWeekCalendarUnit;
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
            // NSLog(@"notification: %@",localNotification);
        }

        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Add" inManagedObjectContext:context];
        [newDevice setValue:self.tx_pillname.text forKey:@"pill"];
         NSString *combineded = [NSString stringWithFormat:@"%@  %@", self.tx_dose.text, self.tx_mg.text];
        [newDevice setValue:combineded forKey:@"dose"];
        [newDevice setValue:self.tx_time.text forKey:@"time"];
        [newDevice setValue:sunday forKey:@"su"];
        [newDevice setValue:monday forKey:@"m"];
        [newDevice setValue:tuesday forKey:@"tu"];
        [newDevice setValue:wednesday forKey:@"w"];
        [newDevice setValue:thursday forKey:@"th"];
        [newDevice setValue:friday forKey:@"f"];
        [newDevice setValue:saturday forKey:@"sa"];
        [newDevice setValue:hr24time forKey:@"hr24time"];
        
        NSDate *todayDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];
       
         [newDevice setValue:convertedDateString forKey:@"startdate"];
        
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
     combined = [NSString stringWithFormat:@"%@ - %@  %@", self.tx_pillname.text, self.tx_dose.text, self.tx_mg.text];
    NSLog(@"nslog %@",combined);
    
    long int counter=notidat.count;
    
    for(int i=0;i<counter;i++)
    {
       long int j =[[notidat objectAtIndex:i]integerValue];
        
        
      //  NSLog(@"array %ld",j);
        
        
        NSDate *nows = [NSDate date];
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        // Extract date components into components1
        NSDateComponents *components1 = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:nows];
        components1.weekday = j;//Monday
        components1.hour = hr;
        components1.minute=min;
        NSDate *fireDates = [gregorianCalendar dateFromComponents:components1];
       
       
//        NSCalendar *calendar = [NSCalendar currentCalendar];
//        NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekday fromDate:nows];//get the required calendar units
//        
//        
//        components.weekday = j;//Monday
//        components.hour = hr;
//        components.minute=min;
//        NSDate *fireDate = [calendar dateFromComponents:components];
        // NSLog(@"date 123456890 = %@", fireDates);
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = fireDates;
         [localNotification setTimeZone:[NSTimeZone  localTimeZone]];
        localNotification.alertBody = combined;
        localNotification.alertTitle =@"Please take your medication";
        localNotification.soundName = @"oh-really.caf";
       
       // localNotification.applicationIconBadgeNumber = +1;
       localNotification.applicationIconBadgeNumber++;
        
        NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"key", nil];
        localNotification.userInfo = infoDict;
        
        
        localNotification.repeatInterval = NSWeekCalendarUnit;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
       // NSLog(@"notification: %@",localNotification);
    }

    
   // [self dismissViewControllerAnimated:YES completion:nil];
     NSLog(@"%@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory  inDomains:NSUserDomainMask] lastObject]);
        TodayList *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                         instantiateViewControllerWithIdentifier:@"WebServiceViewController"];
        [self.navigationController pushViewController:wc animated:YES];
        
    }
    
}


-(BOOL)isFormValid
{
    
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegEx];
    
    if (_tx_pillname.text && _tx_pillname.text.length==0)  {
        [self showErrorMessage:@"Please enter Name of medicine"];
        return NO;
    }
    else if (_tx_dose.text && _tx_dose.text.length==0)
    {
        [self showErrorMessage:@"Please enter Dose in mg/g/tablespoon"];
        return NO;
    }
    else if (_tx_time.text && _tx_time.text.length==0)
    {
        [self showErrorMessage:@"Please enter Time of day"];
        return NO;
    }
    return YES;
}
-(void)showErrorMessage:(NSString *)message
{
    
    UIAlertView *alertmessage = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertmessage show];
    
}


- (IBAction)delete:(id)sender {
    
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];
    NSManagedObjectContext *context = [self managedObjectContext];

    if (self.device) {
    [self.device setValue:@"delete" forKey:@"pillschedualstatus"];
    [self.device setValue:convertedDateString forKey:@"enddate"];
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    NSString* combined1 = [NSString stringWithFormat:@"%@ - %@  %@", self.tx_pillname.text, self.tx_dose.text, self.tx_mg.text];

    NSLog(@"nslog nslog %@",combined1);
    
    
    NSArray *notificationArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for(UILocalNotification *notification in notificationArray){
        if ([notification.alertBody isEqualToString:combined1]  ) {
            // delete this notification
            [[UIApplication sharedApplication] cancelLocalNotification:notification] ;
        }
    }

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return [mg_ary count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //*******************************************************************************************************************
    static  NSString *simpaletableidentifier=@"SimpaleTableItem";
    mg_cell *cell = [tableView dequeueReusableCellWithIdentifier:simpaletableidentifier];
    
   
        cell.mg_lbl.text=[mg_ary objectAtIndex:indexPath.row];
   
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
        mg_cell *cell =[self.mg_table cellForRowAtIndexPath:indexPath];
        //[self.mg_btn setTitle:cell.textLabel.text forState:UIControlStateNormal];
        _tx_mg.text=cell.mg_lbl.text;
        self.mg_table.hidden=YES;
    
    
}



- (IBAction)mg_action:(id)sender {
    // pointlable.text=[NSString stringWithFormat:@"%@1",pointlable.text];
    if (self.mg_table.hidden==YES) {
        self.mg_table.hidden=NO;
    }else{
        self.mg_table.hidden=YES;
    }
    
}

@end
