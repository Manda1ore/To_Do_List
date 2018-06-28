//
//  TappedTask.h
//  To_Do_List
//
//  Created by James Castrejon on 6/28/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Data {
    __unsafe_unretained NSString *name;
    __unsafe_unretained NSDate *date;
};

@interface TappedTask : NSObject

@property (assign, nonatomic) struct Data data;

- (void)setData:(NSString *)name
      argument2: (NSDate *) date;

@end
