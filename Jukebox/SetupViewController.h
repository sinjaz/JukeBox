//
//  SetupViewController.h
//  Jukebox
//
//  Created by Sina Jazayeri on 7/29/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "RoomHandler.h"

@class SetupViewController;



@interface SetupViewController : UIViewController <UITextFieldDelegate, RoomDelegate>{
    CLLocationManager *locationManager;
    RoomHandler *roomHandler;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)nextButton:(id)sender;
@end
