//
//  ViewController.m
//  YZTableViewDemo
//
//  Created by Yuduo Zhang on 1/20/16.
//  Copyright © 2016 Yuduo Zhang. All rights reserved.
//

#import "ViewController.h"
#import "YZTableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *showTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.showTableView = [UIButton new];
    
    [self.showTableView setTitle:@"show table view" forState:UIControlStateNormal];
    
    self.showTableView.frame = CGRectMake(100, 100, 200, 100);
    [self.showTableView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.showTableView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.showTableView.layer.borderWidth = 3;
    
    [self.showTableView addTarget:self action:@selector(showFancyTableView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.showTableView];
}

- (void)showFancyTableView
{
    YZTableViewController *tableVC = [YZTableViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableVC];
    
    [self presentViewController:navController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
