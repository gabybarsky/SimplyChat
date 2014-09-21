//
//  RootViewController.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "NoAnimationSegue.h"
#import "AppDelegate.h"

@interface RootViewController () {
    void (^_overlayBlock)(void);
}

@end

@implementation RootViewController

+ (RootViewController*)rootViewController
{
    AppDelegate *delegate = [AppDelegate sharedAppDelegate];
    return (RootViewController*)delegate.window.rootViewController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //NSBundle *bundle = [NSBundle mainBundle];
        //NSString *name = [NSBundle mainBundle].infoDictionary[@"UIMainStoryboardFile"];
        //UIStoryboard *sb = [UIStoryboard storyboardWithName: name
         //                                            bundle: bundle];
        
        _main = [[ViewController alloc] init];
    }
    
    return self;
}

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame: UIScreen.mainScreen.bounds];
    _mainContainer = [[UIView alloc] initWithFrame: UIScreen.mainScreen.bounds];
    [self.view addSubview: _mainContainer];
    
    [_main willMoveToParentViewController: _main];
    [self addChildViewController: _main];
    [_mainContainer addSubview: _main.view];
    [_main didMoveToParentViewController: self];
}

- (void) setMainViewController:(UIViewController *)main
{
    [_main.view removeFromSuperview];
    [_main removeFromParentViewController];
    
    [main willMoveToParentViewController: main];
    [self addChildViewController: main];
    [main didMoveToParentViewController: self];
    _main = main;
    
    main.view.frame = _mainContainer.bounds;
    [_mainContainer addSubview: main.view];
}

- (void) changePage:(NSString *)identifier
{
    NSBundle *bundle = [NSBundle mainBundle];
    UIStoryboard *sb = [UIStoryboard storyboardWithName: bundle.infoDictionary[@"UIMainStoryboardFile"]
                                                 bundle: bundle];
    UIViewController *destination = [sb instantiateViewControllerWithIdentifier: identifier];
    NoAnimationSegue *segue = [[NoAnimationSegue alloc] initWithIdentifier: @"segueIdentifier"
                                                                      source: _main
                                                                 destination: destination];
    [_main prepareForSegue: segue
                    sender: _main];
    [segue perform];
}

- (void) changeMainController:(UIViewController *)controller
{
    NoAnimationSegue *segue = [[NoAnimationSegue alloc] initWithIdentifier: @"segueIdentifier"
                                                                      source: _main
                                                                 destination: controller];
    [_main prepareForSegue: segue
                    sender: _main];
    [segue perform];
}

- (void) overlayViewController:(UIViewController *)controller withCompletion:(void (^)(void))block
{
    [self addChildViewController: controller];
    [controller didMoveToParentViewController: self];
    [_mainContainer addSubview: controller.view];
    _overlayBlock = block;
}

- (void) removeOverlayController:(UIViewController *)controller
{
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
    _overlayBlock();
    _overlayBlock = nil;
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
