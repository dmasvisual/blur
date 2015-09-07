//
//  ImageProcessor.m
//  BlurButton
//
//  Created by Pau on 2/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import "ImageProcessor.h"

@implementation ImageProcessor

+(UIImage*)readFromFilename:(NSString*)filename{
    UIImage *image = [[UIImage alloc]init];
    image = [UIImage imageNamed:filename];
    return image;
}

+(UIImage*)readFromURL:(NSString*)url{
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];

    return image;
}

+(UIImage*)blurImage:(UIImage*)sourceImage{
    //Class method that apply a blurring filter to a UIImage
    
    CIImage *inputImage = [CIImage imageWithCGImage:sourceImage.CGImage];
    
    // Apply Affine-Clamp filter to stretch the image so that it does not
    // look shrunken when gaussian blur is applied
    CGAffineTransform transform = CGAffineTransformIdentity;
    CIFilter *clampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
    [clampFilter setValue:inputImage forKey:@"inputImage"];
    [clampFilter setValue:[NSValue valueWithBytes:&transform objCType:@encode(CGAffineTransform)] forKey:@"inputTransform"];
    
    // Apply gaussian blur filter with radius of 10
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:clampFilter.outputImage forKey: @"inputImage"];
    [gaussianBlurFilter setValue:@10 forKey:@"inputRadius"];

    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:gaussianBlurFilter.outputImage fromRect:[inputImage extent]];
    
    UIImage* outputImage = [[UIImage alloc] initWithCGImage:cgImage];
    return outputImage;
    
}

+(UIImage*)blurCell:(UITableViewCell *)cell{
    //Class method that apply a blurring filter to a cell. Cell is converted to UIImage.
    UIGraphicsBeginImageContextWithOptions(cell.bounds.size, cell.opaque, 0.0);
    [cell.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *cellImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *blurImage = [ImageProcessor blurImage:cellImage];
    return blurImage;
    
}

+ (UIImage *) blurView:(UIView *)view
{

    //Class method that apply a blurring filter to a view. View is converted to UIImage.
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    //[view.layer renderInContext:UIGraphicsGetCurrentContext()]; //uncomment for other snapchat method
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImage *blurImg = [ImageProcessor blurImage:img];
    

    
    return blurImg;
}





@end
