//
//  NSEvent+RSCore.m
//  RSCore
//
//  Created by Brent Simmons on 11/14/15.
//  Copyright © 2015 Ranchero Software, LLC. All rights reserved.
//

#import "NSEvent+RSCore.h"
#import "NSString+RSCore.h"


@implementation NSEvent (RSCore)


- (void)rs_getCommandKeyDown:(BOOL *)commandKeyDown optionKeyDown:(BOOL *)optionKeyDown controlKeyDown:(BOOL *)controlKeyDown shiftKeyDown:(BOOL *)shiftKeyDown {

	NSEventModifierFlags flags = self.modifierFlags;

	*shiftKeyDown = ((flags & NSShiftKeyMask) != 0);
	*optionKeyDown = ((flags & NSAlternateKeyMask) != 0);
	*commandKeyDown = ((flags & NSCommandKeyMask) != 0);
	*controlKeyDown = ((flags & NSControlKeyMask) != 0);
}


- (BOOL)rs_keyIsModified {
	
	BOOL commandKeyDown = NO;
	BOOL optionKeyDown = NO;
	BOOL controlKeyDown = NO;
	BOOL shiftKeyDown = NO;
	
	[self rs_getCommandKeyDown:&commandKeyDown optionKeyDown:&optionKeyDown controlKeyDown:&controlKeyDown shiftKeyDown:&shiftKeyDown];
	
	return commandKeyDown || optionKeyDown || controlKeyDown || shiftKeyDown;
}


- (unichar)rs_unmodifiedCharacter {
	
	NSString *s = self.charactersIgnoringModifiers;
	if (RSStringIsEmpty(s) || s.length > 1) {
		return (unichar)NSNotFound;
	}
	
	return [s characterAtIndex:0];
}


- (NSString *)rs_unmodifiedCharacterString {

	NSString *s = self.charactersIgnoringModifiers;
	if (RSStringIsEmpty(s) || s.length > 1) {
		return nil;
	}
	
	return s;
}

@end
