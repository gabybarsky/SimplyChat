//
//  AddSocialViewController.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "AddSocialViewController.h"
#import "AddSocialView.h"
#import "RootViewController.h"

@interface AddSocialViewController () {
    UIColor *_backgroundColor;
}

@end

@implementation AddSocialViewController

- (instancetype)initWithColor:(UIColor *)containerBackground
{
    self = [super init];
    if (self) {
        _backgroundColor = containerBackground;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AddSocialView *view = [[AddSocialView alloc] initWithFrame:self.view.bounds];
    view.container.backgroundColor = _backgroundColor;
    self.view = view;
    
    // Link this to facebook login
    [view.login addTarget:self action:@selector(closeOverlay) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) closeOverlay {
    RootViewController *root = [RootViewController rootViewController];
    [root removeOverlayController:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
