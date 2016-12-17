//
//  AllscheduleCell.h
//  nemapp
//
//  Created by Ankur Kumawat on 17/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllscheduleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *pill;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *dot;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sunday;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *monday;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tuesday;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wednesday;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thursday;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *friday;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *saturday;

@property (weak, nonatomic) IBOutlet UILabel *sun_lbl;
@property (weak, nonatomic) IBOutlet UILabel *mon_lbl;
@property (weak, nonatomic) IBOutlet UILabel *tue_lbl;
@property (weak, nonatomic) IBOutlet UILabel *wed_lbl;
@property (weak, nonatomic) IBOutlet UILabel *thu_lbl;
@property (weak, nonatomic) IBOutlet UILabel *fri_lbl;
@property (weak, nonatomic) IBOutlet UILabel *sat_lbl;





@end
