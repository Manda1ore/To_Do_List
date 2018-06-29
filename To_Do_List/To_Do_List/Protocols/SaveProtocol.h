//
//  SaveProtocol.h
//  To_Do_List
//
//  Created by Jacob Althouse on 6/28/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SaveProtocol <NSObject>
-(void) createTask:(Task *) task;
@end
