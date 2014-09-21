//
//  RegisterView.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView () {
    UIColor *_greenColor;
}

@end
@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        _greenColor = [UIColor colorWithRed:71.0f/255.0f
                                      green:255.0f/255.0f
                                       blue:176.0f/255.0f
                                      alpha:1.0f];
        
        self.backgroundColor = [UIColor colorWithRed:15.0f/255.0f
                                               green:182.0f/255.0f
                                                blue:255.0f/255.0f
                                               alpha:1.0f];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 20.0f, width, 20.0f)];
        _titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = _greenColor;
        [self addSubview: _titleLabel];
        
        _nextButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _nextButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
        [_nextButton setTitle:@"Next >" forState:UIControlStateNormal];
        [_nextButton setTitleColor:_greenColor forState:UIControlStateNormal];
        [_nextButton sizeToFit];
        _nextButton.frame = CGRectMake(width/2.0f - _nextButton.frame.size.width/2.0f, height - 70.0f,
                                       _nextButton.frame.size.width, 40.0f);
        [self addSubview: _nextButton];
        
        _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0.0f, 50.0f, width, height - 100.0f)];
        _tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:_tableView];
    }
    
    return self;
}

@end
