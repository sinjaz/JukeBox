//
//  RoomHandler.m
//  Jukebox
//
//  Created by Sina Jazayeri on 8/13/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import "RoomHandler.h"

@implementation RoomHandler

@synthesize delegate;
@synthesize currentRoom = _currentRoom;

static RoomHandler *sharedInstance = nil;

-(void)setCurrentRoom:(PFObject *)currentRoom{
    _currentRoom = currentRoom;
}

-(PFObject*)currentRoom{
    if (!_currentRoom) {
        _currentRoom = [PFObject objectWithClassName:@"Class"];
    }
    return _currentRoom;
}

-(void)deleteRoomForHost:(id)host{
    self.delegate = host;
    
    [_currentRoom deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.delegate roomDeleteComplete];
    }];
}

-(void)createNewRoomWithName:(NSString*)name withLocation:(NSObject*)location forHost:(id)host{
    
    self.delegate = host;
    
    _currentRoom = [PFObject objectWithClassName:@"Host"];
    [_currentRoom setObject:name forKey:@"name"];
    [_currentRoom setObject:location forKey:@"location"];
    
    PFObject *hosts = [PFObject objectWithClassName:@"Hosts"];
    [hosts setObject:_currentRoom forKey:@"host"];
    [hosts saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.delegate roomCreationComplete];
    }];
}

-(void)updateRoomName:(NSString*)name forHost:(id)host{
    [_currentRoom setObject:name forKey:@"name"];
    PFObject *hosts = [PFObject objectWithClassName:@"Hosts"];
    [hosts setObject:_currentRoom forKey:@"host"];
    [hosts saveInBackground];
}

+ (RoomHandler *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance = [[RoomHandler alloc] init];
    });
    
    return sharedInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initialising magic here as you normally would
    }
    
    return self;
}

@end
