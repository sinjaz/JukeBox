//
//  OwnerModel.m
//  Jukebox
//
//  Created by Sina Jazayeri on 7/29/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel

static OwnerModel *sharedOwnerModel = nil;    // static instance variable

+ (OwnerModel *)sharedOwnerModel {
    if (sharedOwnerModel == nil) {
        sharedOwnerModel = [[super allocWithZone:NULL] init];
    }
    return sharedOwnerModel;
}

- (id)init {
    if ( (self = [super init]) ) {
        // your custom initialization
    }
    return self;
}

- (void)customMethod {
    // implement your custom code here
}

// singleton methods
+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedOwnerModel];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
