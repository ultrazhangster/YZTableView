//
//  YZTableViewController.h
//  YZTableViewDemo
//
//  Created by Yuduo Zhang on 1/20/16.
//  Copyright © 2016 Yuduo Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface YZTableViewController : UITableViewController

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

- (void)refreshData;
- (void)refreshDataCompleted;
- (void)loadMoreData;
- (void)loadMoreDataCompletedWithNoMoreData:(BOOL)noMoreData;
- (void)setupFetchedResultsController;
//TODO handle enable and disable load more

@end
