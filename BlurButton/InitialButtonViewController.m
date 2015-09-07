//
//  InitialButtonViewController.m
//  BlurButton
//
//  Created by Pau on 2/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import "InitialButtonViewController.h"


@implementation InitialButtonViewController

- (IBAction)goToBlurListView:(id)sender {
    ViewController *secondViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"TableBlurView"];
    [self presentViewController:secondViewController animated:YES completion:nil] ;
   
}

- (IBAction)goToBlurImageView:(id)sender {
    ViewController *secondViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"BlurImageView"];
    [self presentViewController:secondViewController animated:YES completion:nil] ;
    
}
@end
