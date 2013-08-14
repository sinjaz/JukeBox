//
//  RoomViewController.h
//  Jukebox
//
//  Created by Sina Jazayeri on 8/14/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomHandler.h"

@interface RoomViewController : UIViewController <RoomDelegate> {
    RoomHandler *roomHandler;
}

@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;
- (IBAction)deleteButtonTapped:(id)sender;
@end
