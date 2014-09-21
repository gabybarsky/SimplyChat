//
//  SocialRegisterView.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "SocialRegisterView.h"

@implementation SocialRegisterView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        self.backgroundColor = [UIColor colorWithRed:15.0f/255.0f
                                               green:182.0f/255.0f
                                                blue:255.0f/255.0f
                                               alpha:1.0f];
        
        _facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_facebookButton setImage:[UIImage imageNamed:@"Facebook_Logo.png"] forState:UIControlStateNormal];
        _facebookButton.frame = CGRectMake(width/3.0f - 50.0f, height/2.0f - 25.0f,
                                           50.0f, 50.0f);
        [self addSubview: _facebookButton];
        
        _hangoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hangoutButton setImage:[UIImage imageNamed:@"Hangouts.png"] forState:UIControlStateNormal];
        _hangoutButton.frame = CGRectMake(width/2.0f - 25.0f, height/2.0f - 25.0f,
                                          50.0f, 50.0f);
        [self addSubview: _hangoutButton];
        
        _skypeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_skypeButton setImage:[UIImage imageNamed:@"skype_logo.png"] forState:UIControlStateNormal];
        _skypeButton.frame = CGRectMake(width/3.0f*2.0f, height/2.0f - 25.0f,
                                        50.0f, 50.0f);
        [self addSubview: _skypeButton];
    }
    
    return self;
}

@end
