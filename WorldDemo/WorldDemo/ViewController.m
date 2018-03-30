//
//  ViewController.m
//  WorldDemo
//
//  Created by 栾美娜 on 2018/2/24.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <ViewModel *> *dataSource;

@end

static NSString *const cellID = @"UITableViewCellID";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupUI];
    [self setupDataSource];
}

- (void)setupUI
{
    if (@available(iOS 11.0, *)) {
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
}

- (void)setupDataSource
{
    [self.dataSource addObject:[[ViewModel alloc] initWithTitle:@"富文本" className:@"RchTextViewController"]];
}

#pragma mark - Tableview Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row].title;
    
    return cell;
}

#pragma mark - Tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = self.dataSource[indexPath.row].className;
    Class class = NSClassFromString(className);
    UIViewController *vc = [class new];
    if ([vc isKindOfClass:[UIViewController class]])
    {
        vc.title = self.dataSource[indexPath.row].title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        NSLog(@"className:%@ have error", self.dataSource[indexPath.row].className);
    }

}

#pragma mark - Lazy Load

- (NSMutableArray <ViewModel *> *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataSource;
}

@end
