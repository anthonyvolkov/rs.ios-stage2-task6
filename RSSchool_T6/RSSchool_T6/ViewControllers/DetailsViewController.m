//
//  DetailsViewController.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/25/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIColor+CustomColors.h"

@interface DetailsViewController ()


@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBarTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelCreationDate;
@property (weak, nonatomic) IBOutlet UILabel *labelModificationDate;
@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet UIButton *buttonShare;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.buttonShare.layer.cornerRadius = self.buttonShare.frame.size.height/2;
    self.buttonShare.backgroundColor = [UIColor customYellowColor];
    
    NSArray *resources = [PHAssetResource assetResourcesForAsset:self.phAsset];
    self.navigationBarTitle.title = [((PHAssetResource*)resources[0]) originalFilename];
    
    self.labelCreationDate.text = [self dateFormatter: self.phAsset.creationDate];
    self.labelModificationDate.text = [self dateFormatter: self.phAsset.modificationDate];
    
    
    
    if (self.phAsset.mediaType == PHAssetMediaTypeImage || self.phAsset.mediaType == PHAssetMediaTypeVideo) {
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.resizeMode = PHImageRequestOptionsResizeModeExact;
        
        NSInteger retinaMultiplier = [UIScreen mainScreen].scale;
        
        NSLog(@"view w -%f",self.view.bounds.size.width);
        
        NSLog(@"imageView w - %f",self.imageView.frame.size.width);
        NSLog(@"imageView w - %f",self.imageView.frame.size.height);
        
        
        self.imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * self.phAsset.pixelHeight/self.phAsset.pixelWidth);
        
        NSLog(@"imageView w - %f",self.imageView.frame.size.width);
        NSLog(@"imageView w - %f",self.imageView.frame.size.height);
        
        
        
        CGSize retinaSquare = CGSizeMake(self.view.bounds.size.width * retinaMultiplier, self.view.bounds.size.width * self.phAsset.pixelHeight/self.phAsset.pixelWidth * retinaMultiplier);
        
        [[PHImageManager defaultManager]
         requestImageForAsset:(PHAsset *)self.phAsset
         targetSize:retinaSquare                //PHImageManagerMaximumSize
         contentMode:PHImageContentModeAspectFill
         options:options
         resultHandler:^(UIImage *result, NSDictionary *info) {
            
            self.imageView.image =[UIImage imageWithCGImage:result.CGImage scale:retinaMultiplier orientation:result.imageOrientation];
            
        }];
        
        CGRect contentRect = CGRectZero;
        
        for (UIView *view in self.scrollView.subviews) {
            contentRect = CGRectUnion(contentRect, view.frame);
        }
        self.scrollView.contentSize = contentRect.size;
        
    }
    
    switch (self.phAsset.mediaType) {
        case PHAssetMediaTypeImage:
            self.labelType.text = @"Image";
            break;
        case PHAssetMediaTypeVideo:
            self.labelType.text = @"Video";
            break;
        case PHAssetMediaTypeAudio:
            self.labelType.text = @"Audio";
            break;
        case PHAssetMediaTypeUnknown:
            self.labelType.text = @"Unknown";
            break;
    }
    
    self.navigationBar.barTintColor = [UIColor customYellowColor];
}



- (IBAction)leftBarButtonPressed:(id)sender {
    
//    CATransition *transition = [[CATransition alloc] init];
//    transition.duration = 0.5;
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromLeft;
//    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}


- (IBAction)buttonSharePressed:(id)sender {
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.phAsset] applicationActivities:nil];
    [self presentViewController:activityViewController animated:true completion:nil];
}


- (NSString*) dateFormatter:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *hourFormatter = [[NSDateFormatter alloc] init];
    [hourFormatter setLocalizedDateFormatFromTemplate:@"HH:mm:ss"];
    [dateFormatter setLocalizedDateFormatFromTemplate:@"dd.MM.yyyy"];
    
    return [NSString stringWithFormat:@"%@ %@",[hourFormatter stringFromDate:date],[dateFormatter stringFromDate:date]];
}

@end
