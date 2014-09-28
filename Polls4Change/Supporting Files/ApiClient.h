//
//  ApiClient.h
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

# ifdef STAGING
static NSString * const ILBaseURLString = @"";
# elif DEBUG
static NSString * const ILBaseURLString = @"";
# else
static NSString * const ILBaseURLString = @"";
# endif

@interface ILApiClient : AFHTTPClient

typedef void(^ AFSuccessBlock)(AFHTTPRequestOperation *operation, NSDictionary *responseObject);
typedef void(^ AFFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

+ (instancetype)sharedClient;
+ (void)setAuthorizationToken:(NSString *)accessToken;
+ (void)clearAuthorizationToken;

@end
