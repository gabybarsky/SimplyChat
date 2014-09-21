//
//  WelcomeView.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "WelcomeView.h"

@interface WelcomeView () {
    UIColor *_greenColor;
}

@end
@implementation WelcomeView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        _greenColor = [UIColor colorWithRed:71.0f/255.0f
                                      green:255.0f/255.0f
                                       blue:176.0f/255.0f
                                      alpha:1.0f];
        
        self.backgroundColor = [UIColor colorWithRed:15.0f/255.0f
                                               green:182.0f/255.0f
                                                blue:255.0f/255.0f
                                               alpha:1.0f];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:50.0f];
        _nameLabel.textColor = _greenColor;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"SimplyChat";
        [_nameLabel sizeToFit];
        _nameLabel.frame = CGRectMake(width/2.0f - _nameLabel.frame.size.width/2.0f,
                                      height/2.0f - _nameLabel.frame.size.height/2.0f,
                                      _nameLabel.frame.size.width, _nameLabel.frame.size.height);
        [self addSubview: _nameLabel];
        
        _sloganLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        _sloganLabel.font = [UIFont fontWithName:@"Noteworthy-Light" size:20.0f];
        _sloganLabel.textColor = [_greenColor colorWithAlphaComponent:0.8f];
        _sloganLabel.textAlignment = NSTextAlignmentRight;
        _sloganLabel.text = @"Chat.Simply.";
        [_sloganLabel sizeToFit];
        _sloganLabel.frame = CGRectMake((_nameLabel.frame.origin.x + _nameLabel.frame.size.width) - _sloganLabel.frame.size.width,
                                        (_nameLabel.frame.origin.y +_nameLabel.frame.size.height),
                                        _sloganLabel.frame.size.width, _sloganLabel.frame.size.height);
        [self addSubview: _sloganLabel];
        
        _loginButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_loginButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0f]];
        [_loginButton setTitleColor:_greenColor forState:UIControlStateNormal];
        [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
        _loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_loginButton sizeToFit];
        _loginButton.frame = CGRectMake(width/2.0f - _loginButton.frame.size.width/2.0f,
                                        height - 180.0f, _loginButton.frame.size.width,
                                        40.0f);
        _loginButton.alpha = 0.0f;
        [self addSubview:_loginButton];
        
        _signupButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_signupButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20.0f]];
        [_signupButton setTitleColor:_greenColor forState:UIControlStateNormal];
        [_signupButton setTitle:@"Sign Up" forState:UIControlStateNormal];
        _signupButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_signupButton sizeToFit];
        _signupButton.frame = CGRectMake(width/2.0f - _signupButton.frame.size.width/2.0f,
                                        _loginButton.frame.size.height + _loginButton.frame.origin.y + 10,
                                         _signupButton.frame.size.width, 40.0f);
        _signupButton.alpha = 0.0f;
        [self addSubview:_signupButton];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
