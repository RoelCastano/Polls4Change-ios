//
//  ILSession.m
//  Moneypool
//
//  Created by Patricio Beltran on 8/27/14.
//  Copyright (c) 2014 icalia labs. All rights reserved.
//

#import "ILSession.h"
#import "ApiClient.h"
//#import <Facebook-iOS-SDK/FacebookSDK/FacebookSDK.h>

@implementation ILSession

ILSession *activeSession = nil;

+ (instancetype)newSessionForUser:(User *)currentUser {
    if (activeSession)
        return activeSession;
    
    activeSession = [[self alloc] initWithCurrentUser:currentUser];
    
    return activeSession;
}

/**
 Designated initializer
 */
- (instancetype)initWithCurrentUser:(User *)currentUser {
    self = [super init];
    if (self) {
        self.currentUser = currentUser;
        
        [ILApiClient setAuthorizationToken:currentUser.authToken];
    }
    return self;
}

- (void) clearSessionAndToken {
    [ILApiClient clearAuthorizationToken];
//    [[FBSession activeSession] closeAndClearTokenInformation];
    activeSession = nil;
}

@end
