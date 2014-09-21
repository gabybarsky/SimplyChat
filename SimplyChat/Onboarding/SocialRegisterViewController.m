//
//  SocialRegisterViewController.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "SocialRegisterViewController.h"
#import "SocialRegisterView.h"
#import "RootViewController.h"
#import "AddSocialViewController.h"
#import "AddSocialView.h"

@interface SocialRegisterViewController ()

@end

@implementation SocialRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SocialRegisterView *view = [[SocialRegisterView alloc] initWithFrame:self.view.bounds];
    self.view = view;
    
    [view.facebookButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.hangoutButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.skypeButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) buttonClicked:(UIButton*)sender {
    RootViewController *root = [RootViewController rootViewController];
    AddSocialView *addView = [[AddSocialView alloc] init];
    addView.container.frame = CGRectMake(self.view.center.x, self.view.center.y,
                                         1.0f, 1.0f);
    addView.login.alpha = 0.0f;
    addView.username.alpha = 0.0f;
    addView.password.alpha = 0.0f;
    
    UIView *overlay = [[UIView alloc] initWithFrame:self.view.bounds];
    overlay.backgroundColor = [UIColor blackColor];
    overlay.alpha = 0.0f;
    [self.view addSubview:overlay];
    [self.view addSubview:addView];
    
    // TODO: present and remove the overlay from the button that was clicked
    SocialRegisterView *view = (SocialRegisterView*)self.view;
    int accountType;
    CGPoint originCenter;
    if (sender == view.facebookButton) {
        accountType = Facebook;
        originCenter = view.facebookButton.center;
        addView.container.backgroundColor = [UIColor colorWithRed:45.0f/255.0f
                                                            green:66.0f/255.0f
                                                             blue:139.0f/255.0f
                                                            alpha:1.0f];
    } else if (sender == view.hangoutButton) {
        accountType = Hangouts;
        originCenter = view.hangoutButton.center;
        addView.container.backgroundColor = [UIColor colorWithRed:73.0f/255.0f
                                                            green:163.0f/255.0f
                                                             blue:52.0f/255.0f
                                                            alpha:1.0f];
    } else if (sender == view.skypeButton) {
        accountType = Skype;
        originCenter = view.skypeButton.center;
        addView.container.backgroundColor = [UIColor colorWithRed:21.0f/255.0f
                                                            green:156.0f/255.0f
                                                             blue:239.0f/255.0f
                                                            alpha:1.0f];
    } else {
        NSLog(@"UNAVAILABLE");
        originCenter = view.center;
    }
    
    AddSocialViewController *add = [[AddSocialViewController alloc] initWithColor:addView.container.backgroundColor];
    addView.container.center = originCenter;
    
    [UIView animateWithDuration:0.6f
                     animations:^{
                         overlay.alpha = 0.7f;
                         addView.container.transform = CGAffineTransformMakeScale(200.0f, 200.0f);
                         addView.container.center = view.center;
                         addView.login.alpha = 1.0f;
                         addView.username.alpha = 1.0f;
                         addView.password.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [addView removeFromSuperview];
                         [root overlayViewController:add
                                      withCompletion:^{
                                          [self.view addSubview:addView];
                                          [UIView animateWithDuration:0.6f
                                                           animations:^{
                                                               overlay.alpha = 0.0f;
                                                               addView.container.transform = CGAffineTransformMakeScale(-200.0f, -200.0f);
                                                               addView.container.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
                                                               addView.container.center = originCenter;
                                                               addView.container.alpha = 0.0f;
                                                           } completion:^(BOOL finished) {
                                                               [overlay removeFromSuperview];
                                                               [addView removeFromSuperview];
                                                           }];
                                      }];
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
