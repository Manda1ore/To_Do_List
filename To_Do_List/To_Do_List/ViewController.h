//
//  ViewController.h
//  To_Do_List
//
//  Created by Jacob Althouse on 6/26/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>{
IBOutlet UITableView *TaskTable;
NSMutableArray *TaskArray;
}
@end

