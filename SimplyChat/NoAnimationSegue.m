//
//  NoAnimationSegue.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "NoAnimationSegue.h"
#import "RootViewController.h"

@implementation NoAnimationSegue

- (void) perform {
    UIViewController *destinationViewController = (UIViewController *) self.destinationViewController;
    
    
    RootViewController *root = [RootViewController rootViewController];
    
    [destinationViewController.view removeFromSuperview];
    [root setMainViewController: destinationViewController];
}

@end
