//
//  CustomCell.m
//  BlurButton
//
//  Created by Pau on 3/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(id)init{
    self = [super init];
    self.blurImageView.hidden = YES;
    return self;
}

-(id)initWithLable:(NSString *)label andImage:(UIImage *)image{
    if ((self = [super init])) {
        _myImageView = [[UIImageView alloc]init];

        _myImageView.image = [[UIImage alloc]init];
        _label = [[UILabel alloc]init];
        
        _blurImageView = [[UIImageView alloc] init];
        _blurImageView.hidden = YES;
        
    }
    return self;
}
//-(UIImage*)blurImage{
//    if(!_blurImage){
//        _blurImage = [[UIImage alloc] init];
//        CustomCell *cell = [[CustomCell i];
//        cell.myImageView = [[UIImageView alloc] initWithImage:[ImageProcessor readFromFilename:@"lena_secret.jpg" ]];
//        cell.label = [[UILabel alloc] init];
//        cell.label.text = @"HOLA";
//        
//        _blurImage = [ImageProcessor blurCell:cell];
//    }
//    return _blurImage;
//}


@end
