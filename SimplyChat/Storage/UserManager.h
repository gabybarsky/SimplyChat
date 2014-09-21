//
//  UserManager.h
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

typedef void(^UserManagerCompletionBlock)(User *user, NSError *error);

@interface UserManager : NSObject

/* Return an instance of the current user */
+ (User*) currentUser;

+ (void)storeUser:(User*)user;

@end
