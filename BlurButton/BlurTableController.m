//
//  BlurTableController.m
//  BlurButton
//
//  Created by Pau on 3/9/15.
//  Copyright (c) 2015 visual. All rights reserved.
//

#import "BlurTableController.h"

@implementation BlurTableController

BOOL initial = true;
BOOL blur[5] = {false,false,false,false,false}; //if false, the row is not blur and the image and label is showed. if true, the image and label is hidden and the blurred image is showed
NSMutableArray *imageArray;
NSArray *filenamesArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    //initialize Array with 5 empty UIImage
    imageArray = [[NSMutableArray alloc] initWithObjects: [[UIImage alloc]init],[[UIImage alloc]init],[[UIImage alloc]init],[[UIImage alloc]init],[[UIImage alloc]init], nil];
    //Array of strings of the image's filenames
    filenamesArray = [[NSArray alloc] initWithObjects:@"lena_secret.bmp",@"AppleLogo.jpg",@"lena_secret.bmp",@"AppleLogo.jpg",@"lena_secret.bmp", nil];


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProtCustomCell" forIndexPath:indexPath];


    if(initial){
        //initial setup
        cell.label.text = [NSString stringWithFormat:@"TEST %ld",(long)indexPath.row];
        cell.myImageView.image = [ImageProcessor readFromFilename:[filenamesArray objectAtIndex:indexPath.row]];
        cell.blurImageView.alpha = 0.0;
        cell.myImageView.alpha = 1.0;
        cell.label.alpha = 1.0;
    }
    
    if(!initial){
        cell.label.text = [NSString stringWithFormat:@"TEST %ld",(long)indexPath.row];
        cell.myImageView.image = [ImageProcessor readFromFilename:[filenamesArray objectAtIndex:indexPath.row]];

        //Checking if the UIImage at idexPath.row is empty
        CGImageRef cgref = [[imageArray objectAtIndex:indexPath.row]CGImage];
        CIImage *cim = [[imageArray objectAtIndex:indexPath.row] CIImage];
        if(cim == nil && cgref == NULL){
            //if UIImage is empty, is created and added to the array
            [imageArray replaceObjectAtIndex:indexPath.row withObject:[ImageProcessor blurView:cell.contentView]];
        }
        
        cell.blurImageView.image = [imageArray objectAtIndex:indexPath.row];
        
        //Blur Animation. Alpha of the diferents views is assigned by using the blur array.
        cell.blurImageView.alpha = !blur[indexPath.row]; cell.myImageView.alpha = blur[indexPath.row]; cell.label.alpha = blur[indexPath.row];
        [UIView animateWithDuration:3.0 animations:^{
            [cell setUserInteractionEnabled:NO];
            //alphas are inverted
            cell.blurImageView.alpha = !cell.blurImageView.alpha; cell.myImageView.alpha = !cell.myImageView.alpha; cell.label.alpha = !cell.label.alpha;}
                         completion:^(BOOL finished){
                             [cell setUserInteractionEnabled:YES]; }];

    }
    if(indexPath.row==4)
        initial = false;
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    blur[indexPath.row] = !blur[indexPath.row]; //BOOL in indexPath.row is inverted
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}


@end
