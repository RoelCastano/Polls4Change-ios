//
//  MappingManager.h
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

typedef void (^ RKSuccessBlock)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult);
typedef void (^ RKFailureBlock)(RKObjectRequestOperation *operation, NSError *error);

@interface MappingManager : NSObject

+ (void)setup;
+ (NSIndexSet *)statusCodeSet;

@end

@protocol ILMapper <NSObject>

+ (RKObjectMapping *)mapping;
+ (RKObjectMapping *)mappingWithRelationships;
+ (NSArray *)responseDescriptors;
+ (NSArray *)requestDescriptors;
+ (void)addRelationships;

@end