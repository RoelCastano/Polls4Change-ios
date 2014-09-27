//
//  MappingManager.m
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "MappingManager.h"
#import "ApiClient.h"

@implementation MappingManager
+ (void)setup
{
    RKObjectManager *manager = [[RKObjectManager alloc] initWithHTTPClient:[ILApiClient sharedClient]];
    [RKObjectManager setSharedManager:manager];
    
    NSArray *mappingClasses = @[];
    
    // preload mappings
    [self preloadMappings:mappingClasses];
    
    // preload relationships
    [self preloadRelatioships:mappingClasses];
    
    //Response Descriptors
    [self addResponseDescriptorsForMappings:mappingClasses];
    
    //Request Descriptors
    [self addRequestDescriptorsForMappings:mappingClasses];
    
    //Pagination
    [self addPaginationMapping];
    
}

+ (NSIndexSet *)statusCodeSet {
    return RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
}

+ (void)addResponseDescriptorsForMappings:(NSArray *)mappingClasses {
    for (id<ILMapper> mappingClass in mappingClasses) {
        [[RKObjectManager sharedManager] addResponseDescriptorsFromArray:[mappingClass responseDescriptors]];
    }
}

+ (void)addRequestDescriptorsForMappings:(NSArray *)mappingClasses {
    for (id<ILMapper> mappingClass in mappingClasses) {
        [[RKObjectManager sharedManager] addRequestDescriptorsFromArray:[mappingClass requestDescriptors]];
    }
}

+ (void)addPaginationMapping
{
    RKObjectMapping *paginationMapping = [RKObjectMapping mappingForClass:[RKPaginator class]];
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    [paginationMapping addAttributeMappingsFromDictionary:@{
                                                            @"meta.pagination.per_page":@"perPage",
                                                            @"meta.pagination.total_pages":@"pageCount",
                                                            @"meta.pagination.total_objects":@"objectCount"
                                                            }];
    
    [objectManager setPaginationMapping:paginationMapping];
}

+(void)preloadMappings:(NSArray *)mappingClasses
{
    for (id<ILMapper> mappingClass in mappingClasses) {
        [mappingClass mapping];
    }
}

+(void)preloadRelatioships:(NSArray *)mappingClasses
{
    for (id<ILMapper> mappingClass in mappingClasses) {
        [mappingClass addRelationships];
    }
}

@end
