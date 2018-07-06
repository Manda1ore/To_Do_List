//
//  To_Do_ListTests.m
//  To_Do_ListTests
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface To_Do_ListTests : XCTestCase
@property (strong,nonatomic) ViewController* viewController;
@property (strong, nonatomic) UIStoryboard* storyBoard;
@end

@implementation To_Do_ListTests

- (void)setUp {
    [super setUp];
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewController = [self.storyBoard instantiateViewControllerWithIdentifier:@"ToDoController"];
    [self.viewController view];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    self.storyBoard = nil;
    self.viewController = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWhenTaskAddedToEmptyTable_ThenTableIsNoLongerNull {
    Task *task = [[Task alloc] init];
    task.taskId = 0;
    task.taskName = @"test";
    task.dueDate = [NSDate date];
    [self.viewController updateTaskList:(task)];
    XCTAssertNotNil(self.viewController.taskTable, @"Table is not null");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testDeleteTask {
    Task *task = [[Task alloc] init];
    task.taskId = 0;
    task.taskName = @"test";
    task.dueDate = [NSDate date];
    [self.viewController updateTaskList:(task)];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.viewController tableView:[self.viewController taskTable] commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
}

-(void)testDeleteWithMultipleTasks{
    for(int i = 0; i < 4; i++){
        Task *task = [[Task alloc] init];
        task.taskId = i;
        task.taskName = @"test";
        task.dueDate = [NSDate date];
        [self.viewController updateTaskList:(task)];
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.viewController tableView:[self.viewController taskTable] commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
    XCTAssertEqual(3, [self.viewController.taskTable numberOfRowsInSection:0]);
}

-(void) testEditTask{
    for(int i = 0; i < 4; i++){
        Task *task = [[Task alloc] init];
        task.taskId = i;
        task.taskName = @"test";
        task.dueDate = [NSDate date];
        [self.viewController updateTaskList:(task)];
    }
    Task *editedTask = [[Task alloc] init];
    editedTask.taskId = 0;
    editedTask.taskName = @"editedTest";
    editedTask.dueDate = [NSDate date];
    [self.viewController updateTaskList:(editedTask)];
    XCTAssertEqual(4, [self.viewController.taskTable numberOfRowsInSection:0]);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell =[self.viewController tableView:[self.viewController taskTable] cellForRowAtIndexPath:indexPath];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    NSString *result = [formatter stringFromDate: editedTask.dueDate];
    NSString *expectedString = [NSString stringWithFormat:@"%@ | %@",editedTask.taskName, result];
    XCTAssertEqualObjects(expectedString, cell.textLabel.text);
}
@end
