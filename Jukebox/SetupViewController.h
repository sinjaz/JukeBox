//
//  SetupViewController.h
//  Jukebox
//
//  Created by Sina Jazayeri on 7/29/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SetupViewController : UIViewController <UITextFieldDelegate>{
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)nextButton:(id)sender;
@end
