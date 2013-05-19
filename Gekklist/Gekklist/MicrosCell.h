//
//  MicrosCell.h
//  geeklist
//
//  Created by Kévin Mondésir on 19/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MicrosCell : UITableViewCell
@property (nonatomic,strong)  IBOutlet UILabel * sender;
@property (nonatomic,strong)  IBOutlet UILabel * date;
@property (nonatomic,strong)  IBOutlet UILabel * Comment;
@property (nonatomic,strong)  IBOutlet UIImageView * photo;
@property (nonatomic,strong)  IBOutlet UIButton * bouton;
@property (nonatomic,strong)  IBOutlet UIView * topvue;
@end
