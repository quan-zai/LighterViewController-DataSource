//
//  ViewController.m
//  LighterViewController-DataSource
//
//  Created by 权仔 on 2016/11/24.
//  Copyright © 2016年 XZQ. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"
#import "TableViewCell.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface ViewController () <UITableViewDelegate>

@property (nonatomic, strong) ArrayDataSource *photosArraySource;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    TableViewCellConfigureBlock cellConfigureBlock = ^(TableViewCell *cell, NSString *item) {
        UIButton *button = ((UIButton *)[cell viewWithTag:20]);
        [button setTitle:item forState:UIControlStateNormal];
    };
    
    NSArray *photos = @[@"cell1", @"cell2", @"cell3", @"cell4", @"cell5"];
    _photosArraySource = [[ArrayDataSource alloc] initWithItem:photos
                                                cellIdentifier:PhotoCellIdentifier
                                            configureCellBlock:cellConfigureBlock];
    
    // cell 通过代码方式加载
//    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:PhotoCellIdentifier];
    
    // cell 通过xib的方式加载
    [_tableView registerNib:[TableViewCell nib] forCellReuseIdentifier:PhotoCellIdentifier];
    _tableView.dataSource = _photosArraySource;
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
