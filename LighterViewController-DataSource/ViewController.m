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
#import "Photo.h"
#import "TableViewCell+ConfigureForPhoto.h"

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
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
    TableViewCellConfigureBlock cellConfigureBlock = ^(TableViewCell *cell, Photo *photo) {
        // cell类关注布局
        // cell数据加载放在category中做
        [cell configForPhoto:photo];
    };
    
    // 此处数据源应从网络工具类中获取
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 5; i++) {
        Photo *photo = [[Photo alloc] init];
        photo.name = [NSString stringWithFormat:@"cell%d", i];
        [photos addObject:photo];
    }
    
    // 将数据信息交给photosArraySource处理
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
