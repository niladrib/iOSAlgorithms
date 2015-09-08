//
//  Heap.h
//  Algorithms
//
//  Created by Niladri Bora on 9/7/15.
//  Copyright (c) 2015 Niladri Bora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heap : NSObject

-(instancetype) initWithArray:(NSArray*) inArray;

-(void) buildHeap;

+(NSArray*) heapSort:(NSArray*) inArray;

@end
