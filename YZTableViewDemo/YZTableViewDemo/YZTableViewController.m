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
    
    [self setupFetchedResultsController];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}

- (void)refreshData
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf refreshDataCompleted];
    });
}

- (void)refreshDataCompleted
{
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf loadMoreDataCompletedWithNoMoreData:YES];
    });
}

- (void)loadMoreDataCompletedWithNoMoreData:(BOOL)noMoreData
{
    if (!noMoreData) {
        [self.tableView.mj_footer endRefreshing];
    }
    else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
}

- (void)setupFetchedResultsController
{
    
}

@end
