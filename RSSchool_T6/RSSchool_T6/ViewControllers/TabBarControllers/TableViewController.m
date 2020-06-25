//
//  TableViewController.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "TableViewController.h"
#import "DetailsViewController.h"
#import "TableViewCell.h"
#import <Photos/Photos.h>


@interface TableViewController ()

@property (nonatomic, strong) PHFetchResult *fetchResult;

-(NSString*)formattedDuration:(NSTimeInterval)interval;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    
    PHFetchOptions* options = [[PHFetchOptions alloc]init];
    options.sortDescriptors = @[ [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:true] ];
    self.fetchResult = [PHAsset fetchAssetsWithOptions:options];
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.fetchResult.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DetailsViewController *detailsViewController = [[DetailsViewController  alloc] initWithNibName:@"DetailsViewController" bundle:nil];
    detailsViewController.phAsset = [self.fetchResult objectAtIndex:[indexPath row]];
    
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = 0.5;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromRight;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
    
    
    [self presentViewController:detailsViewController animated:false completion:nil];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    PHAsset *phAsset = [self.fetchResult objectAtIndex:[indexPath row]];
    
    NSArray *resources = [PHAssetResource assetResourcesForAsset:phAsset];
    cell.labelFileName.text = [((PHAssetResource*)resources[0]) originalFilename];
    
    
    if (phAsset.mediaType == PHAssetMediaTypeImage || phAsset.mediaType == PHAssetMediaTypeVideo) {
            PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.resizeMode = PHImageRequestOptionsResizeModeExact;
        
        NSInteger retinaMultiplier = [UIScreen mainScreen].scale;
        CGSize retinaSquare = CGSizeMake(cell.imageFilePreview.image.size.width * retinaMultiplier, cell.imageFilePreview.image.size.height * retinaMultiplier);
        
        [[PHImageManager defaultManager]
         requestImageForAsset:(PHAsset *)phAsset
         targetSize:retinaSquare
         contentMode:PHImageContentModeAspectFill
         options:options
         resultHandler:^(UIImage *result, NSDictionary *info) {
            
            cell.imageFilePreview.image =[UIImage imageWithCGImage:result.CGImage scale:retinaMultiplier orientation:result.imageOrientation];
            
        }];
    }
    
    switch (phAsset.mediaType) {
        case PHAssetMediaTypeImage:
            
            
            cell.imageFileIcon.image = [UIImage imageNamed:@"image"];
            cell.labelFileDescription.text = [NSString stringWithFormat:@"%lux%lu", (unsigned long)phAsset.pixelWidth, (unsigned long)phAsset.pixelHeight];
            break;
        case PHAssetMediaTypeVideo:
            
            
            cell.imageFileIcon.image = [UIImage imageNamed:@"video"];
            cell.labelFileDescription.text = [NSString stringWithFormat:@"%lux%lu  %@", (unsigned long)phAsset.pixelWidth, (unsigned long)phAsset.pixelHeight, [self formattedDuration:phAsset.duration]];
            break;
        case PHAssetMediaTypeAudio:
            
            
            cell.imageFileIcon.image = [UIImage imageNamed:@"audio"];
            cell.labelFileDescription.text = [NSString stringWithFormat:@"%@", [self formattedDuration:phAsset.duration]];
            break;
        case PHAssetMediaTypeUnknown:
            
            
            cell.imageFileIcon.image = [UIImage imageNamed:@"other"];
            cell.labelFileDescription.text = @"";
            break;
    }
    
    
    
    
    return cell;
}


-(NSString*)formattedDuration:(NSTimeInterval)interval {
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.allowedUnits = NSCalendarUnitHour | NSCalendarUnitMinute;
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    NSString *string = [formatter stringFromTimeInterval:interval];
    // output: 0:20:34
    return string;
}

@end
