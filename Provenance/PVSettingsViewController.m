//
//  PVSettingsViewController.m
//  Provenance
//
//  Created by James Addyman on 21/08/2013.
//  Copyright (c) 2013 James Addyman. All rights reserved.
//

#import "PVSettingsViewController.h"
#import "PVSettingsModel.h"

@interface PVSettingsViewController ()

@end

@implementation PVSettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if ((self = [super initWithStyle:style]))
	{
    }
	
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"Settings";
	
	PVSettingsModel *settings = [PVSettingsModel sharedInstance];
	
	[self.autoSaveSwitch setOn:[settings autoSave]];
	[self.autoLoadSwitch setOn:[settings autoLoadAutoSaves]];
	[self.opacitySlider setValue:[settings controllerOpacity]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (IBAction)done:(id)sender
{
	[[self presentingViewController] dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)toggleAutoSave:(id)sender
{
	[[PVSettingsModel sharedInstance] setAutoSave:[self.autoSaveSwitch isOn]];
}

- (IBAction)toggleAutoLoadAutoSaves:(id)sender
{
	[[PVSettingsModel sharedInstance] setAutoLoadAutoSaves:[self.autoLoadSwitch isOn]];
}

- (IBAction)controllerOpacityChanged:(id)sender
{
	[[PVSettingsModel sharedInstance] setControllerOpacity:[self.opacitySlider value]];
}

@end