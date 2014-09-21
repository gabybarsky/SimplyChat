//
//  ViewController.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
#import "User.h"
#import "UserManager.h"
#import "LaunchView.h"
#import "WelcomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LaunchView *view = [[LaunchView alloc] initWithFrame:self.view.bounds];
    self.view = view;
}

- (void)viewDidAppear:(BOOL)animated
{
    LaunchView *view = (LaunchView*)self.view;
    [UIView animateWithDuration:0.8f
                     animations:^{
                         view.sloganLabel.frame = CGRectOffset(view.sloganLabel.frame,
                                                               -view.sloganLabel.frame.size.width, 0.0f);
                     }];
    
    [self performSelector:@selector(changePage) withObject:nil afterDelay:1.2f];
}

-(void) changePage {
    RootViewController *root = [RootViewController rootViewController];
    UIViewController *controller;
    
    if ([UserManager currentUser].email) {
        NSLog(@"HERE");
    } else {
        controller = [[WelcomeViewController alloc] init];
    }
    
    [root changeMainController: controller];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
