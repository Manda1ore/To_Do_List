//
//  Task.h
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject{}

@property(nonatomic, readwrite) NSString* TaskName;
@property(nonatomic, readwrite) NSDate* DueDate;

@end
