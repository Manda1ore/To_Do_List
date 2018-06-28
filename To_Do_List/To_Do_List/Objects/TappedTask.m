//
//  TappedTask.m
//  To_Do_List
//
//  Created by James Castrejon on 6/28/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "TappedTask.h"

@implementation TappedTask

- (void)setData:(NSString *)name
      argument2: (NSString *) date {
    // convert to date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // ignore +11 and use timezone name instead of seconds from gmt
    [dateFormat setDateFormat:@"MM/dd/YY"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"America/Santiago"]];
    NSDate *dte = [dateFormat dateFromString:date];
    
    _data.name = name;
    _data.date = dte;
}

@end
