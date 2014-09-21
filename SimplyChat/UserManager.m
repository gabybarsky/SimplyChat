//
//  UserManager.m
//  SimplyChat
//
//  Created by Gabriel Barsky on 2014-09-20.
//  Copyright (c) 2014 Gabriel Barsky. All rights reserved.
//

#import "UserManager.h"
#import "User.h"

static User *currentUser = nil;

@implementation UserManager

+(User*)currentUser
{
    @synchronized(self) {
        if (!currentUser) {
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            currentUser = [[User alloc] initWithDictionary:[ud objectForKey:@"User"]];
        }
        return currentUser;
    }
}

+ (void)storeUser:(User *)user
{
    @synchronized(self) {
        currentUser = user;
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        if (user) {
            [ud setObject: [user dictionaryValue]
                   forKey: @"User"];
        } else {
            [ud removeObjectForKey: @"User"];
        }
        [ud synchronize];
    }
}
@end
