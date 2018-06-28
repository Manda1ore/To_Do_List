//
//  ViewController.h
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskCreationViewController.h"
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, SaveProtocol>
{
}

@property(nonatomic, strong) IBOutlet UITableView *taskTable;

@end

