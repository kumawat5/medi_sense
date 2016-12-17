//
//  Setting.m
//  nemapp
//
//  Created by Ankur Kumawat on 16/12/16.
//  Copyright © 2016 Sixthsense. All rights reserved.
//

#import "Setting.h"

@interface Setting ()

@end

@implementation Setting

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
}


@end
