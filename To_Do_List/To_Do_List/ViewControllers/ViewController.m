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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if (((NSMutableArray *)[prefs objectForKey:@"Task"]).count== 0) {
        _taskArray = [NSMutableArray array];
        [prefs setObject:_taskArray forKey:@"Task"];
    }
    else{
        _taskArray = [prefs objectForKey:@"Task"];
    }
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
    
    NSString *stringForCell;
    
    stringForCell= [_taskArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:stringForCell];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _taskArray.count;
}

-(void) addTask:(Task *) task{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    _taskArray = (NSMutableArray *)[prefs objectForKey:@"Task"];
    NSLog(@"%@", task.TaskName);
    NSLog(@"%@", _taskArray);
    [_taskArray addObject:(task)];
}



@end
