//
//  SetupViewController.m
//  Jukebox
//
//  Created by Sina Jazayeri on 7/29/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import "SetupViewController.h"
#import "RoomHandler.h"

@interface SetupViewController () <CLLocationManagerDelegate>

@end

@implementation SetupViewController

-(void)roomCreationComplete{
    [self performNextSegue];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    [locations lastObject];
}

- (void)viewDidLoad
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    
    [super viewDidLoad];
    self.nameTextField.delegate = self;

    roomHandler = [RoomHandler sharedInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self nextStep];
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)nextButton:(id)sender {
    [self nextStep];
}

-(void)nextStep{
    if(![self.nameTextField.text isEqualToString:@""]){
        
        NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
        NSNumber *latitude = [NSNumber numberWithDouble:locationManager.location.coordinate.latitude];
        NSNumber *longitude = [NSNumber numberWithDouble:locationManager.location.coordinate.longitude];
        
        [location setValue:latitude forKey:@"latitude"];
        [location setValue:longitude forKey:@"longitude"];
        
        [roomHandler createNewRoomWithName:self.nameTextField.text withLocation:location forHost:self];
    }
}

-(void)performNextSegue{
    [self performSegueWithIdentifier:@"toChooseSongs" sender:self];
}
@end
