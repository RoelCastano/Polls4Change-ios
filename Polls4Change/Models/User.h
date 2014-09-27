//
//  User.h
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MappingManager.h"

@interface User : NSObject

@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) NSString *authToken;
@property (strong, nonatomic) NSString *bank;
@property (strong, nonatomic) NSString *clabe;
@property (strong, nonatomic) NSString *account;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSNumber *wallet;

/**
 Sends a request to login to the app given a access token.
 */
+ (void)loginWithAccessToken:(NSString *)token
                     success:(RKSuccessBlock)success
                     failure:(RKFailureBlock)failure;

/**
 Sends a request to logout from the app
 */
- (void)logOutWithSuccess:(RKSuccessBlock)success
                  failure:(RKFailureBlock)failure;

/**
 Sends a request to load the user by the userId
 */
+ (void)loadUserWithId:(NSNumber *)userId
               success:(RKSuccessBlock)success
               failure:(RKFailureBlock)failure;

/**
 Sends a request to authenticate the user by email and password
 */
+ (void)loginWithEmail:(NSString *)email
              password:(NSString *)password
               success:(RKSuccessBlock)success
               failure:(RKFailureBlock)failure;

/**
 Sends a request to update te details from the user
 */
- (void)updateProfileWithParams:(NSDictionary *)params
                        success:(RKSuccessBlock)success
                        failure:(RKFailureBlock)failure;

@end
