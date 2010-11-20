//
//  PetriPlayer.h
//  Petri
//
//  Created by Alex Heinz on 10/13/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PetriBoardCell;

/*!
 \brief Object representing a player in a Petri game.
 
 PetriPlayer is an abstract class representing a participant in a Petri game, storing the player's items and other status information.
 */
@interface PetriPlayer : NSObject
{
	NSMutableDictionary* items;		/*!< The items currently possessed by the player. Maps PetriItem to NSNumber; i.e., item type to quantity. */
	NSMutableSet* controlledCells;	/*!< The set of cells curently controlled by the player. */
}

/*!
 Adds a cell to the list of cells controlled by the player.

 @param cell the PetriBoardCell that the player now controls
 */
- (void)addControlledCellsObject:(PetriBoardCell*)cell;

/*!
 Removes a cell from the list of cells controlled by the player.
 
 @param cell the PetriBoardCell that the player no longer controls
 */
- (void)removeControlledCellsObject:(PetriBoardCell*)cell;

/*!
 Returns an enumerator for the cells controlled by the player.
 */
- (NSEnumerator*)enumeratorOfControlledCells;

/*!
 Checks whether the player controlls a given cell.
 Returns the cell if s/he does and nil otherwise.
 
 @param cell the cell to check membership of
 */
- (PetriBoardCell*)memberOfControlledCells:(PetriBoardCell*)cell;

/*!
 Returns the number of cells controlled by player.
 */
- (NSUInteger)countOfControlledCells;

/*!
 Returns immutable copy of items dictionary.
 */
@property (readonly) NSDictionary* items;
@end
