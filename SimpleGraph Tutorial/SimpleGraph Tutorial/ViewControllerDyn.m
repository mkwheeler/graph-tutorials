//
//  ViewControllerDyn.m
//  SimpleGraph Tutorial
//
//  Created by Wheeler,Morgan K on 2/10/16.
//  Copyright © 2016 Wheeler,Morgan K. All rights reserved.
//

#import "ViewControllerDyn.h"

@interface ViewControllerDyn ()

@end

@implementation ViewControllerDyn

- (void)viewDidLoad
{
    graphView = [[GraphView alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 180)];
    [graphView setBackgroundColor:[UIColor yellowColor]];
    [graphView setSpacing:10];
    [graphView setFill:YES];
    [graphView setStrokeColor:[UIColor redColor]];
    [graphView setZeroLineStrokeColor:[UIColor greenColor]];
    [graphView setFillColor:[UIColor orangeColor]];
    [graphView setLineWidth:2];
    [graphView setCurvedLines:NO];
    [graphView setArray:[NSArray arrayWithObjects:@"2",@"12",@"5",nil]];
    [self.view addSubview:graphView];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
