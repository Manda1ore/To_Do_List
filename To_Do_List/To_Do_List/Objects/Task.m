//
//  Task.m
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "Task.h"

@implementation Task

- (void)setName: (NSString *)name {
    _TaskName = name;
}

- (void)setDate: (NSDate *)date {
    _DueDate = date;
}

- (NSString *)description {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    NSString *result = [formatter stringFromDate: _DueDate];
    
    return [NSString stringWithFormat: @"%@ | %@", _TaskName, result];
}

@end
