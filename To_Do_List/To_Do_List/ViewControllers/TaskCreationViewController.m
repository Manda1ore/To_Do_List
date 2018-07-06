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
@end

@implementation TaskCreationViewController

int currentId;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.currentTask) {
        _taskNameTextBox.text = self.currentTask.taskName;
        _dueDatePicker.date = self.currentTask.dueDate;
        currentId = self.currentTask.taskId;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveTask:(id)sender {
    Task *task = [[Task alloc] initWithId:currentId];
    task.taskName = self.taskNameTextBox.text;
    task.dueDate = self.dueDatePicker.date;
    [self.delegate updateTaskList:task];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setTask: (Task *)task {
    _currentTask = task;
}

- (void) setId: (int) currId {
    currentId = currId;
}

@end
