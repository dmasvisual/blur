//
//  ImageProcessor.h
//  BlurButton
//
//  Created by Pau on 2/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageProcessor : NSObject

@property (nonatomic,weak) UIImage *image;

+(UIImage*)readFromFilename:(NSString*)filename;

+(UIImage*)readFromURL:(NSString*)url;

+(UIImage*)blurImage:(UIImage*)sourceImage;

+(UIImage*)blurCell:(UITableViewCell *)cell;

+ (UIImage *) blurView:(UIView *)view;



@end
