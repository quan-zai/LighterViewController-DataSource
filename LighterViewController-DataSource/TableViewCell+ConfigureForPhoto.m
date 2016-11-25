//
//  TableViewCell+ConfigureForPhoto.m
//  LighterViewController-DataSource
//
//  Created by 权仔 on 2016/11/25.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "TableViewCell+ConfigureForPhoto.h"

@implementation TableViewCell (ConfigureForPhoto)

- (void)configForPhoto:(Photo *)photo
{
    UIButton *button = (UIButton *)[self viewWithTag:20];
    [button setTitle:photo.name forState:UIControlStateNormal];
}

@end
