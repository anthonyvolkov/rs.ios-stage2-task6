//
//  InfoViewController.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "InfoViewController.h"
#import "RootViewController.h"
#import "CircleView.h"
#import "SquareView.h"
#import "TriangleView.h"
#import "UIColor+CustomColors.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *namePhone;
@property (weak, nonatomic) IBOutlet UILabel *modelPhone;
@property (weak, nonatomic) IBOutlet UILabel *versionIOS;
@property (weak, nonatomic) IBOutlet CircleView *circleView;
@property (weak, nonatomic) IBOutlet SquareView *squareView;
@property (weak, nonatomic) IBOutlet TriangleView *triangleView;
@property (weak, nonatomic) IBOutlet UIButton *buttonCV;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoToStart;

@end

@implementation InfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}


- (void)setupUI {
    
    self.view.backgroundColor = [UIColor customWhiteColor];
    
    self.namePhone.text = [[UIDevice currentDevice] name];
    self.modelPhone.text = [[UIDevice currentDevice] model];
    self.versionIOS.text = [[UIDevice currentDevice] systemVersion];
    
    self.circleView.layer.cornerRadius = self.circleView.frame.size.height/2;
    self.circleView.backgroundColor = [UIColor customRedColor];
    
    self.squareView.backgroundColor = [UIColor customBlueColor];
    
    self.triangleView.triangleColor = [UIColor customGreenColor];
    
    self.buttonCV.layer.cornerRadius = self.buttonCV.frame.size.height/2;
    self.buttonCV.backgroundColor = [UIColor customYellowColor];
    
    self.buttonGoToStart.layer.cornerRadius = self.buttonGoToStart.frame.size.height/2;
    self.buttonGoToStart.backgroundColor = [UIColor customRedColor];
}


- (void)viewDidAppear:(BOOL)animated {
    [self.circleView animate];
    [self.squareView animate];
    [self.triangleView animate];
}


- (IBAction)buttonCVPressed:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://anthonyvolkov.github.io/rsschool-cv/cv"] options:@{} completionHandler:nil];
    
}


- (IBAction)buttonGoToStartPressed:(id)sender {
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = 0.5;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
    [self dismissViewControllerAnimated:false completion:nil];

}



@end
