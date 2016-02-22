//
//  ViewController.m
//  SimpleGraph Tutorial
//
//  Created by Wheeler,Morgan K on 2/10/16.
//  Copyright © 2016 Wheeler,Morgan K. All rights reserved.
//

#import "ViewController.h"
#import "BEMSimpleLineGraphView.h"

@interface ViewController () {
int previousStepperValue;
int totalNumber;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self hydrateDatasets];
    
  /*  BEMSimpleLineGraphView *myGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    myGraph.dataSource = self;
    myGraph.delegate = self;
    [self.view addSubview:myGraph];*/
 
/*    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = {
        1.0, 1.0, 1.0, 1.0,
        1.0, 1.0, 1.0, 0.0
    };*/
    
    self.graph.enableYAxisLabel = YES;
    self.graph.autoScaleYAxis = YES;
    self.graph.alwaysDisplayDots = NO;
    self.graph.enableReferenceXAxisLines = YES;
    self.graph.enableReferenceYAxisLines = YES;
    self.graph.enableReferenceAxisFrame = YES;
}

- (float)getRandomFloat {
    float i1 = (float)(arc4random() % 1000000) / 100 ;
    return i1;
}

- (IBAction)addOrRemovePointFromGraph:(id)sender {
    if (self.graphObjectIncrement.value > previousStepperValue) {
        // Add point
        [self.arrayOfValues addObject:@([self getRandomFloat])];
        NSDate *newDate = [self dateForGraphAfterDate:(NSDate *)[self.arrayOfDates lastObject]];
        [self.arrayOfDates addObject:newDate];
        [self.graph reloadGraph];
    } else if (self.graphObjectIncrement.value < previousStepperValue) {
        // Remove point
        [self.arrayOfValues removeObjectAtIndex:0];
        [self.arrayOfDates removeObjectAtIndex:0];
        [self.graph reloadGraph];
    }
    
    previousStepperValue = self.graphObjectIncrement.value;
}

- (NSDate *)dateForGraphAfterDate:(NSDate *)date {
    NSTimeInterval secondsInTwentyFourHours = 24 * 60 * 60;
    NSDate *newDate = [date dateByAddingTimeInterval:secondsInTwentyFourHours];
    return newDate;
}

- (void)hydrateDatasets {
    // Reset the arrays of values (Y-Axis points) and dates (X-Axis points / labels)
    if (!self.arrayOfValues) self.arrayOfValues = [[NSMutableArray alloc] init];
    if (!self.arrayOfDates) self.arrayOfDates = [[NSMutableArray alloc] init];
    [self.arrayOfValues removeAllObjects];
    [self.arrayOfDates removeAllObjects];
    
    previousStepperValue = self.graphObjectIncrement.value;
    totalNumber = 0;
    NSDate *baseDate = [NSDate date];
    BOOL showNullValue = true;
    
    // Add objects to the array based on the stepper value
    for (int i = 0; i < 9; i++) {
        [self.arrayOfValues addObject:@([self getRandomFloat])]; // Random values for the graph
        if (i == 0) {
            [self.arrayOfDates addObject:baseDate]; // Dates for the X-Axis of the graph
        } else if (showNullValue && i == 4) {
            [self.arrayOfDates addObject:[self dateForGraphAfterDate:self.arrayOfDates[i-1]]]; // Dates for the X-Axis of the graph
            self.arrayOfValues[i] = @(BEMNullGraphValue);
        } else {
            [self.arrayOfDates addObject:[self dateForGraphAfterDate:self.arrayOfDates[i-1]]]; // Dates for the X-Axis of the graph
        }
        
        totalNumber = totalNumber + [[self.arrayOfValues objectAtIndex:i] intValue]; // All of the values added together
    }
}

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
  //  printf((int)[self.arrayOfValues count]);
    return (int)[self.arrayOfValues count];
}


- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    return 5.0;
}

- (NSString *)lineGraph:(BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index {
    
    NSString *label = [self labelForDateAtIndex:index];
    return [label stringByReplacingOccurrencesOfString:@" " withString:@"\n"];
}

- (NSString *)labelForDateAtIndex:(NSInteger)index {
    NSDate *date = self.arrayOfDates[index];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"MM/dd";
    NSString *label = [df stringFromDate:date];
    return label;
}

- (IBAction)refresh:(id)sender {
    [self hydrateDatasets];
    
  //  UIColor *color;
 /*   if (self.graphColorChoice.selectedSegmentIndex == 0) color = [UIColor colorWithRed:31.0/255.0 green:187.0/255.0 blue:166.0/255.0 alpha:1.0];
    else if (self.graphColorChoice.selectedSegmentIndex == 1) color = [UIColor colorWithRed:255.0/255.0 green:187.0/255.0 blue:31.0/255.0 alpha:1.0];
    else if (self.graphColorChoice.selectedSegmentIndex == 2) color = [UIColor colorWithRed:0.0 green:140.0/255.0 blue:255.0/255.0 alpha:1.0];
    
    self.myGraph.enableBezierCurve = (BOOL) self.curveChoice.selectedSegmentIndex;
    self.myGraph.colorTop = color;
    self.myGraph.colorBottom = color;
    self.myGraph.backgroundColor = color;
    self.view.tintColor = color;
    self.labelValues.textColor = color;
    self.navigationController.navigationBar.tintColor = color;
    
    self.myGraph.animationGraphStyle = BEMLineAnimationFade;*/
    [self.graph reloadGraph];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
