//
//  CustomCell.h
//  BlurButton
//
//  Created by Pau on 3/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageProcessor.h"

@interface CustomCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@property (strong, nonatomic) IBOutlet UIImageView *blurImageView;

@property (strong, nonatomic) IBOutlet UILabel *label;



-(id)initWithLable:(NSString*)label andImage:(UIImage*)image;

@end
