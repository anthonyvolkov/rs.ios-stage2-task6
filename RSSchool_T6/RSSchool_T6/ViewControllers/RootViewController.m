//
//  RootViewController.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "RootViewController.h"
#import "MainTabBarController.h"
#import "UIColor+CustomColors.h"
#import "CircleView.h"
#import "SquareView.h"
#import "TriangleView.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet CircleView *circleView;
@property (weak, nonatomic) IBOutlet SquareView *squareView;
@property (weak, nonatomic) IBOutlet TriangleView *triangleView;
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;

- (IBAction)startButtonPressed:(id)sender;

@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}


- (void)setupUI {
    
    self.view.backgroundColor = [UIColor customWhiteColor];
    
    self.circleView.layer.cornerRadius = self.circleView.frame.size.height/2;
    self.circleView.backgroundColor = [UIColor customRedColor];
    
    self.squareView.backgroundColor = [UIColor customBlueColor];
    
    self.triangleView.triangleColor = [UIColor customGreenColor];
    
    self.buttonStart.layer.cornerRadius = self.buttonStart.frame.size.height/2;
    self.buttonStart.backgroundColor = [UIColor customYellowColor];
}


- (void)viewDidAppear:(BOOL)animated {
    [self.circleView animate];
    [self.squareView animate];
    [self.triangleView animate];
}



- (IBAction)startButtonPressed:(id)sender {
    
    MainTabBarController *nxtController = [[MainTabBarController alloc] init];
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = 0.5;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
    [self presentViewController:nxtController animated:false completion:nil];
}


@end
