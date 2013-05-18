//
//  DetailsViewController.h
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController <UITextFieldDelegate,UIScrollViewDelegate>
{
	IBOutlet UIScrollView * scrollView;
	IBOutlet UITextField * textField;
	IBOutlet UIView * InfoMicro;
	
}
@property (retain,readwrite)NSString * titre;
@property (retain,readwrite)NSString * commentaire;
@property (retain,readwrite)UIImage * image;
@end
