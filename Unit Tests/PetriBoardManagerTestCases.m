//
//  PetriBoardManagerTestCases.m
//  Petri
//
//  Created by Alexander Rozenshteyn on 12/6/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriBoardManagerTestCases.h"
#import "PetriBoardManager.h"

@implementation PetriBoardManagerTestCases

- (void)setUp
{
	manager = [PetriBoardManager sharedManager];
}

- (void)tearDown
{
	manager = nil;
}

- (void)testSingleton
{
	PetriBoardManager* newManager = [PetriBoardManager sharedManager];
	STAssertTrue(manager == newManager, @"Only one instance of PetriBoardManager should be able to exist");
}

@end
