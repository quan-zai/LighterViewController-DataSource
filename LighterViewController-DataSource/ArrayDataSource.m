//
//  ArrayDataSource.m
//  LighterViewController-DataSource
//
//  Created by 权仔 on 2016/11/24.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource() 

/// data source Array
@property (nonatomic, strong) NSArray *items;

/// cell identifier
@property (nonatomic, copy) NSString *cellIdentifier;

/// configure cell block
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation ArrayDataSource

- (id)init
{
    return nil;
}

- (id)initWithItem:(NSArray *)anItems
    cellIdentifier:(NSString *)aCellIdentifier
configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger)indexPath.row];
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
