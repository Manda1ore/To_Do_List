//
//  ViewController.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property(nonatomic,strong) NSMutableArray *taskArray;
@property(nonatomic, strong) Task *selectedTask;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _taskArray = [NSMutableArray array];
    self.navigationItem.hidesBackButton = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Task *task;
    
    task = [self.taskArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:task.taskName];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _taskArray.count;
}

- (void)createTask:(Task *) task{
    [self.taskArray addObject:task];
    [self.taskTable reloadData];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ToCreateTask"])
    {
        TaskCreationViewController *destViewController = segue.destinationViewController;
        destViewController.delegate = self;
    }
}
@end
