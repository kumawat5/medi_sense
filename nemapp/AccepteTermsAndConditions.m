//
//  AccepteTermsAndConditions.m
//  nemapp
//
//  Created by Ankur Kumawat on 26/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "AccepteTermsAndConditions.h"

@interface AccepteTermsAndConditions ()

@end

@implementation AccepteTermsAndConditions

- (void)viewDidLoad {
    [super viewDidLoad];
    [_submit setUserInteractionEnabled:NO];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ckeck_btn:(id)sender {
    UIButton *button=(UIButton*)sender;
    
    if(button.tag==1){
        if ([sender isSelected]) {
            [sender setSelected: NO];
            NSLog(@"selected");
            [_check_box setBackgroundImage:[UIImage imageNamed:@"Checkbox-128.png"] forState:UIControlStateNormal];
            [_submit setUserInteractionEnabled:NO];
            NSString *valueToSave = @"not";
            [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"AlreadyLogi"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        } else {
            [sender setSelected: YES];
            NSLog(@"deselected");
            UIImage *newImage = [UIImage imageNamed:@"Checkbox_-_Checked-128.png"];
            [_check_box setBackgroundImage:newImage forState:UIControlStateSelected];
            [_submit setUserInteractionEnabled:YES];
            NSString *valueToSave = @"accept";
            [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"AlreadyLogi"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
        }
    }
}
@end
