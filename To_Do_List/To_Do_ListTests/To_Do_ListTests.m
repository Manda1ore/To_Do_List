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
    Task *task = [[Task alloc] initWithId:0];
    task.taskName = @"test";
    task.dueDate = [NSDate date];
    [self.viewController updateTaskList:(task)];
    
    // EXTRA TEST DATA
    Task *new = [self.viewController.taskArray objectAtIndex:0];
    NSDate *newDate = new.dueDate;
    
    // TEST TABLE ARRAY
    XCTAssertTrue(self.viewController.taskTable != nil, @"Table is not null.");
    XCTAssertTrue(self.viewController.taskArray.count == 1, @"Array [%lu] does not have 1 Item.", (unsigned long)self.viewController.taskArray.count);
    
    // TEST CREATED TASK
    XCTAssertTrue(new.taskId == 0, @"Created Task Id [%ld] does not equal 0.", (long)new.taskId);
    XCTAssertTrue(new.taskId == task.taskId, @"Created Task Id [%ld] does not equal [%ld].", (long)new.taskId, (long)task.taskId);
    XCTAssertTrue([new.taskName isEqualToString: @"test"], @"Created Task Name [%@] does not equal set value test.", new.taskName);
    XCTAssertTrue(new.taskName == task.taskName, @"Created Task Name [%@] does not equal set value [%@].", new.taskName, task.taskName);
    XCTAssertTrue(new.dueDate == newDate, @"Created Task Due Date [%@] does not equal set value [%@].", new.dueDate, newDate);
    XCTAssertTrue(new.dueDate == task.dueDate, @"Created Task Due Date [%@] does not equal set value [%@].", new.dueDate, task.dueDate);
    XCTAssertTrue([new.description isEqualToString: @"test | 7/13/18"], @"Created Task Description [%@] does not equal set value [test | 7/13/18].", new.description);
    XCTAssertTrue([new.description isEqualToString: task.description], @"Created Task Description [%@] does not equal set value [%@].", new.description, task.description);
    XCTAssertTrue(new == task, @"Created task [%@] does not equal set task [%@].", new, task);
    
}

-(void)testDeleteTask {
    Task *task = [[Task alloc] initWithId:0];
    task.taskName = @"test";
    task.dueDate = [NSDate date];
    [self.viewController updateTaskList:(task)];
    XCTAssertTrue(((Task*)[self.viewController.taskArray objectAtIndex:0]).taskId == 0);
    XCTAssertEqual(1, self.viewController.taskArray.count);
    XCTAssertTrue([self.viewController tableView:self.viewController.taskTable numberOfRowsInSection:0] == 1);
    
    [self.viewController.taskArray removeObjectAtIndex:0];
    XCTAssertTrue(self.viewController.taskArray.firstObject == nil);
    XCTAssertEqual(0, self.viewController.taskArray.count);
    XCTAssertTrue([self.viewController tableView:self.viewController.taskTable numberOfRowsInSection:0] == 0);
}

-(void)testDeleteWithMultipleTasks{
    NSMutableArray* tasks = [NSMutableArray arrayWithCapacity:4];
    for(NSInteger i = 0; i < 4; i++){
        Task *task = [[Task alloc] initWithId:i];
        [task setTaskName:@"test"];
        [task setDueDate:[NSDate date]];
        [tasks addObject:task];
        [self.viewController updateTaskList:(task)];
    }
    XCTAssertTrue(tasks.count == self.viewController.taskArray.count);
    for (NSInteger i = 0; i< tasks.count; i++) {
        XCTAssertTrue(tasks[i] == self.viewController.taskArray[i]);
    }
    [self.viewController.taskArray removeObjectAtIndex:0];
    XCTAssertTrue(tasks[0] != self.viewController.taskArray[0]);
    for (NSInteger i = 0; i < self.viewController.taskArray.count; i++) {
        XCTAssertTrue(tasks[i + 1] == self.viewController.taskArray[i]);
    }
    XCTAssertTrue(((Task*)[self.viewController.taskArray objectAtIndex:0]).taskId == 1);
    XCTAssertTrue(tasks.count != self.viewController.taskArray.count);
}

-(void) testEditTask{
    for(int i = 0; i < 4; i++){
        Task *task = [[Task alloc] initWithId:i];
        task.taskName = @"test";
        task.dueDate = [NSDate date];
        [self.viewController updateTaskList:(task)];
    }
    Task *orignalTask = [self.viewController.taskArray objectAtIndex:0];
    Task *editedTask = [[Task alloc] initWithId:0];
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
    
    // EXTRA TEST DATA
    Task *task1 = [self.viewController.taskArray objectAtIndex:0];
    NSDate *newDate = editedTask.dueDate;
    
    // TEST TABLE ARRAY
    XCTAssertTrue(self.viewController.taskTable != nil, @"Table is not null.");
    XCTAssertTrue(self.viewController.taskArray.count == 4, @"Array [%lu] does not have 1 Item.", (unsigned long)self.viewController.taskArray.count);
    
    // TEST NON-EDITED TASKS
    for(int i = 1; i < 4; i++) {
        Task *task = [self.viewController.taskArray objectAtIndex:i];
        NSDate *date = task.dueDate;
        XCTAssertTrue(task.taskId == i, @"Non-edited Task Id [%ld] does not equal %d.", (long)task.taskId, i);
        XCTAssertTrue([task.taskName isEqualToString: @"test"], @"Non-edited Task Name [%@] does not equal set value test.", task.taskName);
        XCTAssertTrue(task.dueDate == date, @"Non-edited Task Due Date [%@] does not equal set value [%@].", task.dueDate, date);
        XCTAssertTrue([task.description isEqualToString: @"test | 7/13/18"], @"Non-edited Task Description [%@] does not equal set value [test | 7/13/18].", task.description);
    }
    
    // TEST EDITED TASK (OLD VALUES)
    XCTAssertTrue(task1.taskId == 0, @"Non-edited Task Id [%ld] does not equal 0.", (long)task1.taskId);
    XCTAssertTrue(![task1.taskName isEqualToString: @"test"], @"Non-edited Task Name [%@] does equal old value test.", task1.taskName);
    XCTAssertTrue(task1.dueDate != orignalTask.dueDate, @"Non-edited Task Due Date [%@] does equal old value [%@].", task1.dueDate, orignalTask.dueDate);
    XCTAssertTrue(![task1.description isEqualToString: orignalTask.description], @"Non-edited Task Description [%@] does equal old value [%@].", task1.description, orignalTask.description);
    XCTAssertTrue(task1 != orignalTask, @"Edited task [%@] does equal old task [%@].", editedTask, task1);
    XCTAssertTrue(editedTask != orignalTask, @"Edited task [%@] does equal old task [%@].", editedTask, task1);
    
    // TEST EDITED TASK (NEW VALUES)
    XCTAssertTrue(task1.taskId == 0, @"Edited Task Id [%ld] does not equal 0.", (long)task1.taskId);
    XCTAssertTrue(task1.taskId == editedTask.taskId, @"Edited Task Id [%ld] does not equal [%ld].", (long)task1.taskId, (long)editedTask.taskId);
    XCTAssertTrue([task1.taskName isEqualToString: @"editedTest"], @"Edited Task Name [%@] does not equal set value editedTest.", task1.taskName);
    XCTAssertTrue(task1.taskName == editedTask.taskName, @"Edited Task Name [%@] does not equal set value [%@].", task1.taskName, editedTask.taskName);
    XCTAssertTrue(task1.dueDate == newDate, @"Edited Task Due Date [%@] does not equal set value [%@].", task1.dueDate, newDate);
    XCTAssertTrue(task1.dueDate == editedTask.dueDate, @"Edited Task Due Date [%@] does not equal set value [%@].", task1.dueDate, editedTask.dueDate);
    XCTAssertTrue([task1.description isEqualToString: @"editedTest | 7/13/18"], @"Edited Task Description [%@] does not equal set value [editedTest | 7/13/18].", task1.description);
    XCTAssertTrue([task1.description isEqualToString: editedTask.description], @"Edited Task Description [%@] does not equal set value [%@].", task1.description, editedTask.description);
    XCTAssertTrue(task1 == editedTask, @"Edited task [%@] does not equal set task [%@].", task1, editedTask);
    
}
@end
