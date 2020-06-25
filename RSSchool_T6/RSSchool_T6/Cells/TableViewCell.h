//
//  TableViewCell.h
//  RSSchool_T6
//
//  Created by anthony volkov on 6/25/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageFilePreview;
@property (weak, nonatomic) IBOutlet UILabel *labelFileName;
@property (weak, nonatomic) IBOutlet UIImageView *imageFileIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelFileDescription;

@end

NS_ASSUME_NONNULL_END
