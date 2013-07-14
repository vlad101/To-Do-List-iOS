//
//  DetailViewController.h
//  To-Do-List
//
//  Created by Vladimir Efros on 7/13/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface DetailViewController : UIViewController
<UITextViewDelegate>
{}

@property (nonatomic, strong) Item *item;

@end
