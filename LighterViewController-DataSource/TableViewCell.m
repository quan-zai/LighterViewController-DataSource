//
//  TableViewCell.m
//  LighterViewController-DataSource
//
//  Created by 权仔 on 2016/11/25.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"TableViewCell" bundle:nil];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
