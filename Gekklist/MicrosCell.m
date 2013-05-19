//
//  MicrosCell.m
//  geeklist
//
//  Created by Kévin Mondésir on 19/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "MicrosCell.h"

@implementation MicrosCell
@synthesize topvue,sender;
@synthesize date;
@synthesize Comment;
@synthesize photo;
@synthesize bouton;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		
		
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
