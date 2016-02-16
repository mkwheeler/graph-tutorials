//
//  ViewController.h
//  SimpleGraph Tutorial
//
//  Created by Wheeler,Morgan K on 2/10/16.
//  Copyright © 2016 Wheeler,Morgan K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraphView.h"

@interface ViewController : UIViewController <BEMSimpleLineGraphDataSource, BEMSimpleLineGraphDelegate>

@property (weak, nonatomic) IBOutlet UIView *LineGraphView;
@property (strong, nonatomic) NSMutableArray *arrayOfValues;
@property (strong, nonatomic) NSMutableArray *arrayOfDates;

@property (strong, nonatomic) IBOutlet UILabel *labelValues;
@property (strong, nonatomic) IBOutlet UILabel *labelDates;

@property (weak, nonatomic) IBOutlet UIStepper *graphObjectIncrement;
- (IBAction)refresh:(id)sender;
- (IBAction)addOrRemovePointFromGraph:(id)sender;

@end

