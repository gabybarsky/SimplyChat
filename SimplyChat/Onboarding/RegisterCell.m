//
//  RegisterCell.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "RegisterCell.h"

@implementation RegisterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIColor *greenColor = [UIColor colorWithRed:71.0f/255.0f
                                              green:255.0f/255.0f
                                               blue:176.0f/255.0f
                                              alpha:1.0f];
        
        _cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 10.0f, 100.0f, 20.0f)];
        _cellTitle.font = [UIFont fontWithName:@"Noteworthy-Light" size:16.0];
        [self addSubview:_cellTitle];
        
        _cellField = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 10.0f,
                                                                   self.frame.size.width - 120.0f, 20.0f)];
        _cellField.font = [UIFont fontWithName:@"Noteworthy-Light" size:16.0];
        _cellField.backgroundColor = [greenColor colorWithAlphaComponent:0.3f];
        [self addSubview:_cellField];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
