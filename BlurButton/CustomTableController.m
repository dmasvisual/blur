//
//  CustomTableController.m
//  BlurButton
//
//  Created by Pau on 3/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import "CustomTableController.h"



@implementation CustomTableController


NSMutableArray *_BlurredImages;
BOOL _showBlurred[5] =  {false,false,false,false,false};


- (void)viewDidLoad {
    [super viewDidLoad];

    //_showBlurredImages  = [@[@true,@false,@true,@false,@true] mutableCopy];
    
    _BlurredImages = [[NSMutableArray alloc] init];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"TEST %ld",(long)indexPath.row];
    if(!cell.imageView.image)
    cell.imageView.image = [ImageProcessor readFromFilename:@"lena_secret.bmp"];
    
    //converting to UIImage
    if(_showBlurred[indexPath.row]){
//        UIGraphicsBeginImageContextWithOptions(cell.bounds.size, cell.opaque, 0.0);
//        [cell.layer renderInContext:UIGraphicsGetCurrentContext()];
//        UIImage *cellImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        UIImage *blurImage = [ImageProcessor blurImage:cellImage];
//        cell.imageView.image = blurImage;
        cell.imageView.image = [ImageProcessor blurCell:cell];
        
    }

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:NO];
    _showBlurred[indexPath.row] = !_showBlurred[indexPath.row];
    
    
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}



- (NSArray *)BlurredImages{
    if(!_BlurredImages) _BlurredImages = [[NSMutableArray alloc]init];
    return _BlurredImages;
}



@end
