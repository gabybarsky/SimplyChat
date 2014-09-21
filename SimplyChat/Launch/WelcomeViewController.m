//
//  WelcomeViewController.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "WelcomeViewController.h"
#import "WelcomeView.h"
#import "RegisterView.h"
#import "RegisterViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WelcomeView *view = [[WelcomeView alloc] initWithFrame:self.view.bounds];
    self.view = view;
    
    [UIView animateWithDuration: 1.5f
                          delay: 0.5f
                        options: nil
                     animations:^{
                         view.nameLabel.frame = CGRectOffset(view.nameLabel.frame, 0.0f, -160.0f);
                         view.sloganLabel.frame = CGRectOffset(view.sloganLabel.frame, 0.0f, -160.0f);
                         view.loginButton.alpha = 1.0f;
                         view.signupButton.alpha = 1.0f;
                     } completion:^(BOOL finished) {}];
    
    [view.signupButton addTarget:self action:@selector(signup) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) signup {
    WelcomeView *view = (WelcomeView*)self.view;
    RegisterView *registerView = [[RegisterView alloc] initWithFrame:self.view.bounds];
    registerView.alpha = 0.0;
    [view addSubview:registerView];
    
    [UIView animateWithDuration:1.0f delay:0.2f options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         registerView.alpha = 1.0f;
                     } completion:NULL];
    [UIView animateWithDuration:1.0f
                     animations:^{
                         view.nameLabel.frame = CGRectMake(view.nameLabel.frame.origin.x,
                                                           -view.nameLabel.frame.size.height,
                                                           view.nameLabel.frame.size.width,
                                                           view.nameLabel.frame.size.height);
                         view.sloganLabel.frame = CGRectMake(view.sloganLabel.frame.origin.x,
                                                           -view.sloganLabel.frame.size.height,
                                                           view.sloganLabel.frame.size.width,
                                                           view.sloganLabel.frame.size.height);
                         view.nameLabel.alpha = 0.0f;
                         view.sloganLabel.alpha = 0.0f;
                         
                         view.loginButton.alpha = 0.0f;
                         view.signupButton.transform = CGAffineTransformMakeScale(3.0f, 3.0f);
                         view.signupButton.alpha = 0.0f;
                         
                     } completion:^(BOOL finished) {
                         RootViewController *root = [RootViewController rootViewController];
                         RegisterViewController *dest = [[RegisterViewController alloc] init];
                         [root changeMainController:dest];
                     }];
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
