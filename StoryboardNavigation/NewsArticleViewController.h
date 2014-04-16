//
//  ViewController.h
//  StoryboardNavigation
//
//  Created by 김사랑 on 13. 12. 27..
//  Copyright (c) 2013년 김사랑. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Fliter;
@class HtmlParserclass;
@class MainNewsViewController;
@class News;
@class AppDelegate;

@interface NewsArticleViewController : UIViewController{
    
    Fliter *fliter;
    HtmlParserclass *htmlparsing;
    MainNewsViewController *newscontroller;
    NSMutableArray * saveNewsArr;
    News *news;
    NSMutableString *newstext;
    NSMutableArray *stringobject;
    NSString * newsdetail;
    NSString * photourl;
   
}

@property (retain, nonatomic) IBOutlet UITextView *Textscroll;
@property (strong, nonatomic) IBOutlet UILabel *IbIMessage;
@property (strong, nonatomic)id passData;
@property (strong, nonatomic)id passData1;
@property (strong, nonatomic)id passData2;
@property (nonatomic, retain) NSString *textbuffer;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doscrap;
@property (strong, nonatomic) NSMutableArray *saveNewArr;
@property (strong, nonatomic) NSMutableString *newstext;
@property (strong, nonatomic) NSMutableArray *stringobject;
@property (strong, nonatomic) NSString * newsdetail;
@property (strong, nonatomic) NSString * photourl;


@end
