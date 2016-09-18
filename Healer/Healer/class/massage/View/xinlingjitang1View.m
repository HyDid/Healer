//
//  xinlingjitang1View.m
//  Healer
//
//  Created by LiHongYu on 16/4/20.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "xinlingjitang1View.h"
#import "smallLableViewObject.h"


@implementation xinlingjitang1View

- (NSMutableArray *)smallLableViewObjects {
    if (_smallLableViewObjects == nil) {
        _smallLableViewObjects = [NSMutableArray array];
    }
    
    return _smallLableViewObjects;
}
- (void)viewDidLoad {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Courses.plist" ofType:nil];
    NSArray *smallObjects = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in smallObjects) {
        smallLableViewObject *small = [smallLableViewObject smallViewWithDict:dict];
        [self.smallLableViewObjects addObject:small];
    }

}
-(void)setsmallLableView{

        self.oneView.smallLableViewObject = self.smallLableViewObjects[0];
        self.twoView.smallLableViewObject = self.smallLableViewObjects[1];
        self.thirdView.smallLableViewObject = self.smallLableViewObjects[2];
        self.fourView.smallLableViewObject = self.smallLableViewObjects[3];
        self.fiveView.smallLableViewObject = self.smallLableViewObjects[4];
}


@end
