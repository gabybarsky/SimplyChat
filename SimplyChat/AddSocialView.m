//
//  AddSocialView.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "AddSocialView.h"

@implementation AddSocialView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _container = [[UIView alloc] initWithFrame:CGRectZero];
        _container.backgroundColor = [UIColor lightGrayColor];
        _container.frame = CGRectMake(self.center.x - 100.0f, self.center.y - 100.0f, 200.0f, 200.0f);
        
        _username = [[UITextField alloc] initWithFrame:CGRectMake(30.0f, 40.0f, 200.0f - 60.0f, 20.0f)];
        _username.placeholder = @"Username";
        [_container addSubview: _username];
        
        _password = [[UITextField alloc] initWithFrame:CGRectMake(30.0f, 80.0f, 200.0f - 60.0f, 20.0f)];
        _password.placeholder = @"Password";
        _password.secureTextEntry = YES;
        [_container addSubview: _password];
        
        _login = [UIButton buttonWithType:UIButtonTypeCustom];
        [_login setTitle:@"Login" forState:UIControlStateNormal];
        [_login sizeToFit];
        _login.frame = CGRectMake(200.0f/2.0f - _login.frame.size.width/2.0f, 200.0f - 60.0f,
                                  _login.frame.size.width, 40.0f);
        [_container addSubview:_login];
        [self addSubview:_container];
    }
    
    return self;
}

@end
