//
//  NavigationBar.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        self.barTintColor = [UIColor colorWithRed:203.0f/255.0f
                                               green:249.0f/255.0f
                                                blue:255.0f/255.0f
                                               alpha:1.0f];
        
        UIBarButtonItem *infoItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:nil];
        [self setItems:@[infoItem]];
    }
    return self;
}

@end
