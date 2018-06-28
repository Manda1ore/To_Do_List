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
- (IBAction)saveTask:(id)sender {
    Task *task = [[Task alloc] init];
    task.taskName = self.taskNameTextBox.text;
    task.dueDate = self.dueDatePicker.date;
    [self.delegate createTask:task ];
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:true completion: nil];
}



#pragma mark - Navigation



@end
