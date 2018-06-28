//
//  ViewController.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "ViewController.h"
#import "TappedTask.h"

@interface ViewController () { }

@property(nonatomic,strong) NSMutableArray *taskArray;
@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpArray {
    Task *task = [[Task alloc] init];
    Task *task2 = [[Task alloc] init];
    Task *task3 = [[Task alloc] init];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:28];
    [comps setMonth:06];
    [comps setYear:2018];
    
    [task setTaskName: @"Buy Grocieries"];
    [task setDueDate:[[NSCalendar currentCalendar] dateFromComponents:comps]];
    [task2 setTaskName: @"Talk With Britta"];
    [task2 setDueDate:[[NSCalendar currentCalendar] dateFromComponents:comps]];
    [task3 setTaskName: @"Finish Homework"];
    [task3 setDueDate:[[NSCalendar currentCalendar] dateFromComponents:comps]];
    
    
    _taskArray = [NSMutableArray arrayWithArray: @[task.description, task2.description, task3.description]];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *taskDetails;
    taskDetails= [_taskArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:taskDetails];
    
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

-(void) addTask:(Task *) task{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    _taskArray = (NSMutableArray *)[prefs objectForKey:@"Task"];
    NSLog(@"%@", task.TaskName);
    NSLog(@"%@", _taskArray);
    [_taskArray addObject:(task)];
}

- (IBAction)editTapped:(id)sender {
    // TODO: - Send data from tapped task to new View.
    // Insert data into View elements.
    // When complete, replace data in array
    TappedTask *task = [[TappedTask alloc] init];
    
    NSArray *array = [[NSArray alloc] init];
    array = [_taskArray[0] componentsSeparatedByString:@"|"];
    
    [task setData:array[0] argument2:array[1]];
    NSLog(@" Name: %@, Date: %@", task.data.name, task.data.date.description);
    
}

@end
