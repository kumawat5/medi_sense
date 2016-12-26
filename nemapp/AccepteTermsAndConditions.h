//
//  AccepteTermsAndConditions.h
//  nemapp
//
//  Created by Ankur Kumawat on 26/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccepteTermsAndConditions : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *check_box;
- (IBAction)ckeck_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submit;

@end
