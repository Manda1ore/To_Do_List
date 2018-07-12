//
//  TaskCreationViewController.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/27/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "TaskCreationViewController.h"
@interface TaskCreationViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextBox;
@property (strong, nonatomic) Task *currentTask;
@property (nonatomic, assign) NSInteger *currentId;
@end

@implementation TaskCreationViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _dueDatePicker.minimumDate = [NSDate date];
    if (self.currentTask) {
        _taskNameTextBox.text = self.currentTask.taskName;
        _dueDatePicker.date = self.currentTask.dueDate;
        self.currentId = self.currentTask.taskId;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveTask:(id)sender {
    Task *task = [[Task alloc] initWithId:self.currentId];
    task.taskName = self.taskNameTextBox.text;
    task.dueDate = self.dueDatePicker.date;
    [self.delegate updateTaskList:task];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setTask: (Task *)task {
    _currentTask = task;
}

- (void) setId:(NSInteger*)currId {
    self.currentId = currId;
}

@end
