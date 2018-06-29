//
//  TaskCreationViewController.h
//  To_Do_List
//
//  Created by Jacob Althouse on 6/27/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
@protocol SaveProtocol <NSObject>
-(void) createTask:(Task *) task;
@end

@interface TaskCreationViewController : UIViewController
@property (strong, nonatomic) id<SaveProtocol> delegate;
- (void) setTask: (Task *)task;
- (void) setId: (int)currId;

@end
