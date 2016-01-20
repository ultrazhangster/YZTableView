//
//  ViewController.m
//  YZTableViewDemo
//
//  Created by Yuduo Zhang on 1/20/16.
//  Copyright © 2016 Yuduo Zhang. All rights reserved.
//

#import "ViewController.h"

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
    
    [self.view addSubview:self.showTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
