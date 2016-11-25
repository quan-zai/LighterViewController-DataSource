//
//  ArrayDataSource.h
//  LighterViewController-DataSource
//
//  Created by 权仔 on 2016/11/24.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItem:(NSArray *)anItems
    cellIdentifier:(NSString *)aCellIdentifier
configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
