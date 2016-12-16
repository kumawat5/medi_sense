//
//  TodayTableViewCell.h
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
@interface TodayTableViewCell : SWTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dot;
@property (weak, nonatomic) IBOutlet UILabel *name_dose;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *takentime;

@end
