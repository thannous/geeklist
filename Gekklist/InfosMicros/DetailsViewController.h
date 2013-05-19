//
//  DetailsViewController.h
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface DetailsViewController : UIViewController <UITextFieldDelegate,UIScrollViewDelegate,UITextViewDelegate>
{
	IBOutlet UIScrollView * scrollView;
	IBOutlet UITextField * textField;
	IBOutlet UILabel * Micros;
	IBOutlet UIView * InfoMicro;
	IBOutlet UILabel * Nom;
	IBOutlet UIImageView * portrait;
	IBOutlet UILabel * EmmeteurName;
	
}
@property (nonatomic,assign)NSMutableArray * datas;
@property (retain,readwrite)NSString * titre;
@property (assign,readwrite)int ButtonNumber;
@property (retain,readwrite)NSString * commentaire;
@property (retain,readwrite)UIImage * image;
-(void)useAllData;
@end
