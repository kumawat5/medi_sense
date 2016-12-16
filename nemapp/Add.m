//
//  Add.m
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "Add.h"

@interface Add ()
{
    NSString*monday;
    NSString*tuesday;
    NSString*wednesday;
    NSString*thursday;
    NSString*friday;
    NSString*saturday;
    NSString*sunday;
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
    // Do any additional setup after loading the view.
     _sun_btn.layer.cornerRadius = 7;
    _sun_btn.layer.masksToBounds = YES;
    [[_sun_btn layer] setBorderWidth:2.0f];
    [[_sun_btn layer] setBorderColor:[UIColor orangeColor].CGColor];
   
    
    _mon_btn.layer.cornerRadius = 7;
   _mon_btn.layer.masksToBounds = YES;
    [[_mon_btn layer] setBorderWidth:2.0f];
    [[_mon_btn layer] setBorderColor:[UIColor orangeColor].CGColor];
    
    _tue_btn.layer.cornerRadius = 7;
    _tue_btn.layer.masksToBounds = YES;
    [[_tue_btn layer] setBorderWidth:2.0f];
    [[_tue_btn layer] setBorderColor:[UIColor orangeColor].CGColor];

    
    _wed_btn.layer.cornerRadius = 7;
    _wed_btn.layer.masksToBounds = YES;
    [[_wed_btn layer] setBorderWidth:2.0f];
    [[_wed_btn layer] setBorderColor:[UIColor orangeColor].CGColor];
    
    _th_btn.layer.cornerRadius = 7;
    _th_btn.layer.masksToBounds = YES;
    [[_th_btn layer] setBorderWidth:2.0f];
    [[_th_btn layer] setBorderColor:[UIColor orangeColor].CGColor];
    
    _fri_btn.layer.cornerRadius = 7;
    _fri_btn.layer.masksToBounds = YES;
    [[_fri_btn layer] setBorderWidth:2.0f];
    [[_fri_btn layer] setBorderColor:[UIColor orangeColor].CGColor];
    
    _sat_btn.layer.cornerRadius = 7;
    _sat_btn.layer.masksToBounds = YES;
    [[_sat_btn layer] setBorderWidth:2.0f];
    [[_sat_btn layer] setBorderColor:[UIColor orangeColor].CGColor];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeTime;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [_tx_time setInputView:datePicker];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)_tx_time.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"H:MM a"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _tx_time.text = [NSString stringWithFormat:@"%@",dateString];
}


-(IBAction)action:(id)sender{
    
    UIButton *button=(UIButton*)sender;
    
    if(button.tag==1){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
             self.sun_btn.backgroundColor = [UIColor clearColor];
            sunday = @"nil";
        } else {
            [sender setSelected: YES];
             NSLog(@"deselected");
            self.sun_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _sun_btn.tintColor=[UIColor clearColor];
            sunday = @"Sunday";
            
        }
    }
    if(button.tag==2){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            self.mon_btn.backgroundColor = [UIColor clearColor];
            monday = @"nil";
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            self.mon_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _mon_btn.tintColor=[UIColor clearColor];
            monday = @"Monday";
            
        }
   

    }
    if(button.tag==3){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            self.tue_btn.backgroundColor = [UIColor clearColor];
            tuesday = @"nil";
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            self.tue_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _tue_btn.tintColor=[UIColor clearColor];
            tuesday = @"Tuesday";
            
        }

    }
    if(button.tag==4){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            self.wed_btn.backgroundColor = [UIColor clearColor];
            wednesday = @"nil";
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            self.wed_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _wed_btn.tintColor=[UIColor clearColor];
            wednesday = @"Wednesday";
            
        }
    }
    if(button.tag==5){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            self.th_btn.backgroundColor = [UIColor clearColor];
            thursday = @"nil";
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            self.th_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _th_btn.tintColor=[UIColor clearColor];
            thursday = @"Thursday";
            
        }

    }
    if(button.tag==6){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            self.fri_btn.backgroundColor = [UIColor clearColor];
            friday = @"nil";
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            self.fri_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _fri_btn.tintColor=[UIColor clearColor];
            friday = @"Friday";
            
        }

    }
    if(button.tag==7){
        
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            self.sat_btn.backgroundColor = [UIColor clearColor];
            saturday = @"nil";
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            self.sat_btn.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:92.0/255.0 blue:5.0/255.0 alpha:1.0];
            _sat_btn.tintColor=[UIColor clearColor];
            saturday = @"Saturday";
            
        }
    }
    
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        // Update existing device
//        [self.device setValue:self.nameTextField.text forKey:@"name"];
//        [self.device setValue:self.versionTextField.text forKey:@"version"];
//        [self.device setValue:self.companyTextField.text forKey:@"company"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Add" inManagedObjectContext:context];
        [newDevice setValue:self.tx_pillname.text forKey:@"pill"];
        [newDevice setValue:self.tx_dose.text forKey:@"dose"];
        [newDevice setValue:self.tx_time.text forKey:@"time"];
        [newDevice setValue:sunday forKey:@"su"];
        [newDevice setValue:monday forKey:@"m"];
        [newDevice setValue:tuesday forKey:@"tu"];
        [newDevice setValue:wednesday forKey:@"w"];
        [newDevice setValue:thursday forKey:@"th"];
        [newDevice setValue:friday forKey:@"f"];
        [newDevice setValue:saturday forKey:@"sa"];
        
        NSDate *todayDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];         NSString *convertedDateString = [dateFormatter stringFromDate:todayDate];
         [newDevice setValue:convertedDateString forKey:@"startdate"];
        
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
   // [self dismissViewControllerAnimated:YES completion:nil];
     NSLog(@"%@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory  inDomains:NSUserDomainMask] lastObject]);
    
}
@end
