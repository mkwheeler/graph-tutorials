//
//  ViewControllerDyn.h
//  SimpleGraph Tutorial
//
//  Created by Wheeler,Morgan K on 2/10/16.
//  Copyright © 2016 Wheeler,Morgan K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface ViewControllerDyn : UIViewController <UITextFieldDelegate> {
    
    GraphView *graphView;
    
}

@property (strong, nonatomic) GraphView *graphView;


@end
