//
//  RoomViewController.m
//  Jukebox
//
//  Created by Sina Jazayeri on 8/14/13.
//  Copyright (c) 2013 Jazayeri, Sina (HBO). All rights reserved.
//

#import "RoomViewController.h"

@interface RoomViewController ()

@end

@implementation RoomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    roomHandler = [RoomHandler sharedInstance];
    
    self.roomNameLabel.text = [roomHandler.currentRoom objectForKey:@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteButtonTapped:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"DELETE"
                              message:@"Are you sure?"
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1){
        [roomHandler deleteRoomForHost:self];
    }
}

-(void)roomDeleteComplete{
    
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
