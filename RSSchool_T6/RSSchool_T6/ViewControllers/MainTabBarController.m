//
//  MainTabBarController.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/23/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "MainTabBarController.h"
#import "UIColor+CustomColors.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
#import "InfoViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor customWhiteColor];
    
    
    TableViewController *tableViewController = [[TableViewController alloc] init];
    tableViewController.navigationItem.title = @"Info";
    
    UINavigationController *tabBarController1 = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    tabBarController1.tabBarItem.image = [UIImage imageNamed:@"info_unselected"];
    tabBarController1.navigationBar.barTintColor = [UIColor customYellowColor];

    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewFlowLayout.itemSize = CGSizeMake((self.view.bounds.size.width/3 - 4 * 5), (self.view.bounds.size.width/3 - 4 * 5));
    collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    collectionViewFlowLayout.sectionInset = UIEdgeInsetsZero;
    
    CollectionViewController *collectionViewController = [[CollectionViewController alloc] initWithCollectionViewLayout:collectionViewFlowLayout];
    collectionViewController.navigationItem.title = @"Gallery";
    
//    UIViewController *collectionViewController = [[UIViewController alloc] init];
//    collectionViewController.navigationItem.title = @"Gallery";
    

    
    UINavigationController *tabBarController2 = [[UINavigationController alloc] initWithRootViewController:collectionViewController];
    tabBarController2.tabBarItem.image = [UIImage imageNamed:@"gallery_unselected"];
    tabBarController2.navigationBar.barTintColor = [UIColor customYellowColor];
    
    
    InfoViewController *infoViewController = [[InfoViewController  alloc] initWithNibName:@"InfoViewController" bundle:nil];
    infoViewController.navigationItem.title = @"RSSchool Task 6";
    
    UINavigationController *tabBarController3 = [[UINavigationController alloc] initWithRootViewController:infoViewController];
    tabBarController3.tabBarItem.image = [UIImage imageNamed:@"home_unselected"];
    //    nav.tabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    tabBarController3.navigationBar.barTintColor = [UIColor customYellowColor];
    
    
    self.viewControllers = @[tabBarController1, tabBarController2, tabBarController3];
    
}


@end
