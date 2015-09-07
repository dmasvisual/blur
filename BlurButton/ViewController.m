//
//  ViewController.m
//  BlurButton
//
//  Created by Pau on 2/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

NSString *filename = @"AppleLogo.jpg";
//NSString *url= @"http://vrworld.com/wp-content/uploads/2014/05/AppleLogo.jpg";
NSString *url= @"http://www.hack4fun.org/h4f/sites/default/files/bindump/lena_secret.bmp";





- (void)viewDidLoad {
    [super viewDidLoad];

    //from filename
    //UIImage *finalImage = [ImageProcessor readFromFilename:filename];
    
    //from url
    UIImage *finalImage = [ImageProcessor readFromURL:url];
    
    //processing
    //finalImage = [ImageProcessor blurImage:finalImage];
    
    self.imageView.image = finalImage;
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView sizeToFit];
    
}


- (IBAction)blurButton:(UIButton *)sender {
    //processing
    UIImage *finalImage = self.imageView.image;
    
    finalImage = [ImageProcessor blurImage:finalImage];
    
    self.imageView.image = finalImage;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
