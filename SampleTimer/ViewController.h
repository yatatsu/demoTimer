//
//  ViewController.h
//  SampleTimer
//
//  Created by kitagawa on 2014/07/29.
//  Copyright (c) 2014年 appirits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

