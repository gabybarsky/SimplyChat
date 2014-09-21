//
//  RootViewController.h
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMenuWidth 254.0f

@interface RootViewController : UIViewController

@property (nonatomic,readonly) UIView *mainContainer;
@property (nonatomic,readonly) UIViewController *main;

+ (RootViewController*)rootViewController;
- (void) setMainViewController:(UIViewController*)main;
- (void) changePage:(NSString*)identifier;
- (void) changeMainController:(UIViewController*)controller;
- (void) overlayViewController:(UIViewController*)controller withCompletion:(void (^)(void))block;
- (void) removeOverlayController:(UIViewController*)controller;

@end
