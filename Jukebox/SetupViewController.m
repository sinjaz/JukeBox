//
//  SetupViewController.m
//  Jukebox
//
//  Created by Sina Jazayeri on 7/29/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import "SetupViewController.h"
#import <Parse/Parse.h>

@interface SetupViewController () <CLLocationManagerDelegate>

@end

@implementation SetupViewController

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
	// Do any additional setup after loading the view.
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
        
        PFObject *newHost = [PFObject objectWithClassName:@"Host"];
        [newHost setObject:self.nameTextField.text forKey:@"name"];
        
        NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
        NSNumber *latitude = [NSNumber numberWithDouble:locationManager.location.coordinate.latitude];
        NSNumber *longitude = [NSNumber numberWithDouble:locationManager.location.coordinate.longitude];
        
        [location setValue:latitude forKey:@"latitude"];
        [location setValue:longitude forKey:@"longitude"];
        
        [newHost setObject:location forKey:@"location"];
        
        PFObject *hosts = [PFObject objectWithClassName:@"Hosts"];
        [hosts setObject:newHost forKey:@"host"];
        [hosts saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [self performNextSegue];
        }];
    }
}

-(void)performNextSegue{
    [self performSegueWithIdentifier:@"toChooseSongs" sender:self];
}
@end
