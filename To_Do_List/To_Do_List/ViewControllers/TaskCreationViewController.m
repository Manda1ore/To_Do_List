//
//  TaskCreationViewController.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/27/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "TaskCreationViewController.h"
@interface TaskCreationViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *DueDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *TaskNameTextBox;

@end

@implementation TaskCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ToMainViewController"])
    {
        // Get reference to the destination view controller
        ViewController *vc = [segue destinationViewController];
        NSString *taskName = _TaskNameTextBox.text;
        NSDate *dueDate = _DueDatePicker.date;
        Task *task = [[Task alloc] init];
        task.TaskName = taskName;
        task.DueDate = dueDate;
        // Pass any objects to the view controller here, like...
        [vc addTask :task];
    }
}

@end
