//
//  TaskTableViewCell.m
//  To_Do_List
//
//  Created by Jacob Althouse on 7/9/18.
//  Copyright © 2018 Jacob Althouse. All rights reserved.
//

#import "TaskTableViewCell.h"

@implementation TaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithTask:(Task *)task reuseIdentifier: (NSString*) cellIdentifier{
    self = [super initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    [self.textLabel setText: task.description];
    self.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)task.taskId];
    return self;
}
@end
