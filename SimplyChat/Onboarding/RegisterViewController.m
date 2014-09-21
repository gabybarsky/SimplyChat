//
//  RegisterViewController.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "RegisterCell.h"
#import "SocialRegisterViewController.h"
#import "RootViewController.h"

@interface RegisterViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RegisterView *view = [[RegisterView alloc] initWithFrame:self.view.bounds];
    view.tableView.delegate = self;
    view.tableView.dataSource = self;
    self.view = view;
    
    [view.nextButton addTarget:self action:@selector(nextClicked) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) datePickerValueChanged:(RegisterCell*)cell {
    //cell.cellField =
}

- (void) nextClicked {
    SocialRegisterViewController *social = [[SocialRegisterViewController alloc] init];
    RootViewController *root = [RootViewController rootViewController];
    [root changeMainController:social];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (RegisterCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RegisterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RegisterCell"];
    if (!cell) {
        cell = [[RegisterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RegisterCell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.cellTitle.text = @"Full Name:";
            break;
        case 1:
            cell.cellTitle.text = @"Email:";
            break;
        case 2:
            cell.cellTitle.text = @"Username:";
            break;
        case 3:
            cell.cellTitle.text = @"Password:";
            cell.cellField.secureTextEntry = YES;
            break;
        case 4:
            cell.cellTitle.text = @"Birthday:";
            UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:cell.cellField.frame];
            datePicker.datePickerMode = UIDatePickerModeDate;
            [cell addSubview:datePicker];
            unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
            [components setDay:31];
            [components setMonth:12];
            datePicker.maximumDate = [calendar dateFromComponents:components];
            [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
            [cell.cellField setInputView:datePicker];
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
