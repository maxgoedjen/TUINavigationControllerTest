//
//  AppDelegate.m
//  TUINavigationControllerTest
//
//  Created by Max Goedjen on 11/12/12.
//  Copyright (c) 2012 Clink Apps. All rights reserved.
//

#import "AppDelegate.h"
#import "ColorViewController.h"

@interface AppDelegate ()

@property (nonatomic) TUINavigationController *navController;
@property (nonatomic) ColorViewController *red;
@property (nonatomic) ColorViewController *green;
@property (nonatomic) ColorViewController *blue;
@property (nonatomic) ColorViewController *purple;
@property (nonatomic) ColorViewController *orange;
@property (nonatomic) ColorViewController *black;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    CGRect b = CGRectMake(0, 0, 500, 450);
    _window = [[NSWindow alloc] initWithContentRect:b styleMask:NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:NO];
	[_window setMinSize:NSMakeSize(300, 250)];
	[_window center];
	
	TUINSView *insView = [[TUINSView alloc] initWithFrame:b];
	
    [_window setContentView:insView];
    
    [_window makeKeyAndOrderFront:nil];
	
	_red = [[ColorViewController alloc] initWithColor:[NSColor redColor]];
	_green = [[ColorViewController alloc] initWithColor:[NSColor greenColor]];
	_blue = [[ColorViewController alloc] initWithColor:[NSColor blueColor]];
	_purple = [[ColorViewController alloc] initWithColor:[NSColor purpleColor]];
	_orange = [[ColorViewController alloc] initWithColor:[NSColor orangeColor]];
	_black = [[ColorViewController alloc] initWithColor:[NSColor blackColor]];
	_navController = [[TUINavigationController alloc] initWithRootViewController:_red];
	[insView setRootView:_navController.view];
	
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(_pushPop) userInfo:nil repeats:YES];

}

- (void)_pushPop {
	if ([[_navController viewControllers] count] > 3) {
//		[_navController popToRootViewControllerAnimated:YES];
//		[_navController popToViewController:[_navController viewControllers][1] animated:YES];
        [_navController setViewControllers:@[_green, _black] animated:YES];
//		[_navController popViewControlerAnimated:YES];
	} else {
		TUIViewController *color;
		switch ([[_navController viewControllers] count]) {
			case 0:
				color = _green;
				break;
			case 1:
				color = _blue;
				break;
			case 2:
				color = _purple;
				break;
			case 3:
				color = _orange;
				break;
				
			default:
				break;
		}
		[_navController pushViewController:color animated:YES];
	}
	
}

@end
