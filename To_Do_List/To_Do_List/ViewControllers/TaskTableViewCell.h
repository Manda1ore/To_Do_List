//
//  TaskTableViewCell.h
//  To_Do_List
//
//  Created by Jacob Althouse on 7/9/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
@interface TaskTableViewCell : UITableViewCell
- (id) initWithTask:(Task*) task reuseIdentifier:(NSString*)cellIdentifier;
@end
