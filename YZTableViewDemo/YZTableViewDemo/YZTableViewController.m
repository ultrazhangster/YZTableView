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
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([YZTableViewController class])];
    
    [self setupFetchedResultsController];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
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
        [weakSelf loadMoreDataCompletedWithNoMoreData:NO];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 27;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YZTableViewController class])];
    
    cell.textLabel.text = [NSString stringWithFormat:@"row index : %ld", (long)indexPath.row];
    return cell;
}

@end
