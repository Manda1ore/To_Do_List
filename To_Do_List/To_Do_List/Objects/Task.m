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
    _taskName = name;
}

- (void)setDate: (NSDate *)date {
    _dueDate = date;
}

@end
