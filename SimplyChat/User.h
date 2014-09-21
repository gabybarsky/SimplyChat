//
//  User.h
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "DictionarySerializable.h"

@interface User : DictionarySerializable

/**
 * will be using username as the main identifier for all accounts
 */
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *birthdate;

// stuff for later
@property (nonatomic, strong) NSDate *lastLogin;
@property (nonatomic, strong) NSDate *creationDate;

@end
