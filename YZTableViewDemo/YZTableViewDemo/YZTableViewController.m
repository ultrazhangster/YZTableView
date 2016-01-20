//
//  YZTableViewController.m
//  YZTableViewDemo
//
//  Created by Yuduo Zhang on 1/20/16.
//  Copyright © 2016 Yuduo Zhang. All rights reserved.
//

#import "YZTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@implementation YZTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)refreshData
{
    
}

- (void)loadMoreData
{
    
}

- (void)setupFetchedResultsController
{
    
}

@end
