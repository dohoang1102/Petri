//
//  PetriBoardCell.h
//  Petri
//
//  Created by Alex Heinz on 10/13/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PetriCellType.h"

@class PetriPlayer;
@class PetriItem;

/*!
 \brief Object representing a cell on the game board.
 
 The PetriBoardCell class stores information about an individual "place" (i.e., a single unit in the coordinate system) on a game board, including the type of cell, the which player (if any) controls the cell, and, if present, an item that can be picked up when the cell is claimed.
 */
@interface PetriBoardCell : NSObject <NSCopying>
{
	PetriCellType cellType;	/*!< The type of cell. */
	PetriPlayer* owner;		/*!< The player currently controlling the cell, if any. Will be nil if cellType is not headCell or bodyCell. */
	PetriItem* pickUp;		/*!< The item picked up when this cell is claimed, if any. Will be nil if cellType is not unoccupiedCell. */
}

/**
 * Default constructor
 * Initializes owner and item to nil and type to unoccupied
 */
- (id)init;

/**
 * Initializes a PetriBoardCell with the specified type, owner, if any, and item, if any.
 * @param type The type of cell
 * @param player The player currently controlling the cell; may be nil.
 * @param item The item picked up when this cell is claimed; may be nil.
 */
- (id)initWithCellType:(PetriCellType)type
				 owner:(PetriPlayer*)player
				pickUp:(PetriItem*)item;

/*!
 Tests for equality of two PetriBoardCell objects.
 \note This method does \e not test whether a PetriBoardCell object represents the same location on the board as another, merely whether two cells have the same values for their respective properties.
 */
- (BOOL)isEqualToCell:(PetriBoardCell*)cell;

@property (readwrite, assign) PetriCellType cellType;
@property (readwrite, assign) PetriPlayer* owner;
@property (readwrite, copy) PetriItem* pickUp;

@end
