//
//  ColorViewController.m
//  TUINavigationControllerTest
//
//  Created by Max Goedjen on 11/13/12.
//  Copyright (c) 2012 Clink Apps. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@property (nonatomic) NSColor *color;

@end

@implementation ColorViewController

- (id)initWithColor:(NSColor *)color {
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		_color = color;
	}
	return self;
}

- (void)loadView {
	self.view = [[TUIView alloc] initWithFrame:CGRectZero];
	self.view.backgroundColor = _color;
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"Will appear");
}

- (void)viewDidAppear:(BOOL)animated {
	NSLog(@"Will appear");
}

- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"Will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"Did disappear");
}

- (void)keyDown:(NSEvent *)theEvent {
	NSLog(@"%@", theEvent);
}
@end
