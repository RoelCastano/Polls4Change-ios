//
//  User.m
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "User.h"

@implementation User
+ (void)loginWithAccessToken:(NSString *)token
                     success:(RKSuccessBlock)success
                     failure:(RKFailureBlock)failure
{
    [[RKObjectManager sharedManager] postObject:[[User alloc] init]
                                           path:@"fb_sessions"
                                     parameters:@{@"user" : @{@"oauth_token" : token }}
                                        success:success
                                        failure:failure];
}

- (void)logOutWithSuccess:(RKSuccessBlock)success
                  failure:(RKFailureBlock)failure {
    
    [[RKObjectManager sharedManager] deleteObject:self
                                             path:@"sessions"
                                       parameters:nil
                                          success:success
                                          failure:failure];
}

+ (void)loadUserWithId:(NSNumber *)userId
               success:(RKSuccessBlock)success
               failure:(RKFailureBlock)failure {
    
    [[RKObjectManager sharedManager] getObject:[[User alloc] init]
                                          path:[NSString stringWithFormat:@"users/%@", userId.stringValue]
                                    parameters:nil
                                       success:success
                                       failure:failure];
}

+ (void)loginWithEmail:(NSString *)email
              password:(NSString *)password
               success:(RKSuccessBlock)success
               failure:(RKFailureBlock)failure {
    
    [[RKObjectManager sharedManager] postObject:[[User alloc] init]
                                           path:@"sessions"
                                     parameters:@{@"user": @{
                                                          @"email": email,
                                                          @"password": password
                                                          }}
                                        success:success
                                        failure:failure];
}

- (void)updateProfileWithParams:(NSDictionary *)params
                        success:(RKSuccessBlock)success
                        failure:(RKFailureBlock)failure {
    
    [[RKObjectManager sharedManager] patchObject:self
                                            path:[NSString stringWithFormat:@"users/%@", self.userId.stringValue]
                                      parameters: params
                                         success:success
                                         failure:failure];
}

@end
