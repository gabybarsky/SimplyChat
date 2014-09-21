//
//  MessageView.h
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageView : UIView

// header bar
@property (nonatomic,strong) UINavigationBar *navBar;
@property (nonatomic,strong) UILabel *contactLabel;
@property (nonatomic,strong) UIButton *infoButton;
@property (nonatomic,strong) UIButton *moreButton;

// footer bar
@property (nonatomic,strong) UIView *footerBar;
//@property (nonatomic,strong) UI
@end
