//
//  PetriItem.m
//  Petri
//
//  Created by Alex Heinz on 10/13/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriItem.h"

@implementation PetriItem

- (id)copyWithZone:(NSZone*)zone
{
	return [[[self class] allocWithZone:zone] init];
}

- (id)init
{
	// Check that we aren't instantiating an abstract class
	if ([self isMemberOfClass:[PetriItem class]])
	{
		[self doesNotRecognizeSelector:_cmd];
		return nil;
	}

	return self;
}

- (void)useItemOnCells:(NSArray*)cells
				pieces:(NSArray*)pieces
			   players:(NSArray*)players
			  byPlayer:(PetriPlayer*)usingPlayer
			   onBoard:(id<PetriBoard>)board
{
	// Check that we aren't using an abstract class
	if ([self isMemberOfClass:[PetriItem class]])
	{
		[self doesNotRecognizeSelector:_cmd];
		return;
	}
}

- (BOOL)validateItemOnCells:(NSArray*)cells
					 pieces:(NSArray*)pieces
					players:(NSArray*)players
				   byPlayer:(PetriPlayer*)usingPlayer
					onBoard:(id<PetriBoard>)board
{
	// Check that we aren't using an abstract class
	if ([self isMemberOfClass:[PetriItem class]])
	{
		[self doesNotRecognizeSelector:_cmd];
		return NO;
	}
	return NO;
}

#pragma mark -
#pragma mark Comparators

- (BOOL)isEqual:(id)object
{
	if (![object isKindOfClass:[self class]])
		return NO;
	
	return [self isEqualToItem:(PetriItem*)object];
}

- (BOOL)isEqualToItem:(PetriItem*)item
{
	return [[self itemName] isEqual:[item itemName]];
}

- (NSUInteger)hash
{
	return [[self itemName] hash];
}

#pragma mark -
#pragma mark Accessors

- (NSString*)itemName
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

- (BOOL)allowsCaptures
{
	return NO;
}

- (NSImage*)icon
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

@end
