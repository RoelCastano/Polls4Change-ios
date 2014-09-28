//
//  ILSession.h
//  Moneypool
//
//  Created by Patricio Beltran on 8/27/14.
//  Copyright (c) 2014 icalia labs. All rights reserved.
//

#import "User.h"

@interface ILSession : NSObject

/**
 Specifies the user that is currently loged in.
 */
@property (nonatomic, strong) User *currentUser;

/**
 Returns the active session or creates a new one if there is none.
 @param currentUser ILUser that represent the user that is logged in.
 */
+ (instancetype)newSessionForUser:(User *)currentUser;

/**
 Clears the current session
 */
- (void) clearSessionAndToken;

extern ILSession *activeSession;

@end
