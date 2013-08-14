//
//  RoomHandler.h
//  Jukebox
//
//  Created by Sina Jazayeri on 8/13/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class SetupViewController;

@protocol RoomDelegate <NSObject>
- (void)roomCreationComplete;
@optional
- (void)foo:(SetupViewController *)foo didDoSomethingAnimated:(BOOL)flag;
@end

@interface RoomHandler : NSObject

+ (id)sharedInstance;
-(void)createNewRoomWithName:(NSString*)name withLocation:(NSObject*)location forHost:(id)host;
-(void)updateRoomName:(NSString*)name forHost:(id)host;

@property (nonatomic, strong) PFObject *currentRoom;

@property (nonatomic, assign) id <RoomDelegate> delegate;

@end