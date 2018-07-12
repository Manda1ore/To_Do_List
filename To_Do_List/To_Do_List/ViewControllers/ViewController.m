//
//  ViewController.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) Task *selectedTask;
@property(nonatomic, assign) NSInteger* counter;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _taskArray = [NSMutableArray array];
    self.navigationItem.hidesBackButton = true;
    self.counter = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Task *task;
    task = [self.taskArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:task.description];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)task.taskId];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _taskArray.count;
}

// Remove
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_taskArray removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation: UITableViewRowAnimationFade];
    }
}

- (void)updateTaskList:(Task *) task{
    bool taskFound = NO;
    for (NSInteger num = 0; num < self.taskArray.count && !taskFound; num++) {
        if (num == *task.taskId) {
            taskFound = YES;
            [self.taskArray replaceObjectAtIndex:num withObject:task];
        }
    }
    if (!taskFound) {
        [self.taskArray addObject:task];
        _counter++;
    }
    [self.taskTable reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TaskCreationViewController *destViewController = segue.destinationViewController;
    destViewController.delegate = self;
    if ([[segue identifier] isEqualToString:@"ToCreateTask"]) {
        [destViewController setId: self.counter];
    } else if ([[segue identifier] isEqualToString:@"editTask"]) {
        UITableViewCell *cell = sender;
        int taskId = (int)[cell.detailTextLabel.text integerValue];
        Task *task = [self.taskArray objectAtIndex:taskId];
        [destViewController setTask:task];
    }
}
@end
