//
//  Task.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "Task.h"

@implementation Task
- (id) initWithId:(int)taskID{
    self = [super init];
    _taskId = taskID;
    return self;
}

- (void)setName: (NSString *)name {
    _taskName = name;
}

- (void)setDate: (NSDate *)date {
    _dueDate = date;
}

- (NSString *)description {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    NSString *result = [formatter stringFromDate: _dueDate];
    
    return [NSString stringWithFormat: @"%@ | %@", _taskName, result];
}

@end
