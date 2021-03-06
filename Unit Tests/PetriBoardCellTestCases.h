//
//  PetriBoardCellTestCases.h
//  Petri
//
//  Created by Paul Martin on 10/10/27.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class PetriBoardCell;

@interface PetriBoardCellTestCases : SenTestCase
{
	PetriBoardCell* testCell;
}

- (void)testCellPropertyComparison;
- (void)testCellCopy;

@end
