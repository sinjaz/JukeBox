//
//  OwnerModel.h
//  Jukebox
//
//  Created by Sina Jazayeri on 7/29/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OwnerModel : NSObject {
    // whatever instance vars you want
}

+ (OwnerModel *)sharedOwnerModel;   // class method to return the singleton object

- (void)customMethod; // add optional methods to customize the singleton class

@end