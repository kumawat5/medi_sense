//
//  Add.h
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface Add : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *tx_time;
@property (weak, nonatomic) IBOutlet UITextField *tx_dose;
@property (weak, nonatomic) IBOutlet UITextField *tx_pillname;
@property (strong) NSManagedObject *device;
- (IBAction)save:(id)sender;

- (IBAction)delete:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tx_mg;
@property (weak, nonatomic) IBOutlet UIButton *mg_btn;
- (IBAction)mg_action:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *mg_table;



@end
