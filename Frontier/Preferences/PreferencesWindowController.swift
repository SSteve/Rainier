//
//  PreferencesWindowController.swift
//  Frontier
//
//  Created by Brent Simmons on 8/1/15.
//  Copyright © 2015 Ranchero Software, LLC. All rights reserved.
//

import Cocoa

private struct PreferencesToolbarItemSpec {

	let identifier: String // Toolbar item identifier and view controller identifier in storyboard
	let name: String
	let imageName: String
}

private let toolbarItemIdentifierGeneral = "General"

class PreferencesWindowController : NSWindowController, NSToolbarDelegate {
	
	private let windowFrameName = "Preferences"
	fileprivate var viewControllers = [String: NSViewController]()
	fileprivate let toolbarItemSpecs: [PreferencesToolbarItemSpec] = {
		var specs = [PreferencesToolbarItemSpec]()
		specs += [PreferencesToolbarItemSpec(identifier: toolbarItemIdentifierGeneral, name: NSLocalizedString("General", comment: "Preferences"), imageName: NSImageNamePreferencesGeneral)]
		return specs
	}()


	override func windowDidLoad() {

		let toolbar = NSToolbar(identifier: "PreferencesToolbar")
		toolbar.delegate = self
		toolbar.autosavesConfiguration = false
		toolbar.allowsUserCustomization = false
		toolbar.displayMode = .iconAndLabel
		toolbar.selectedItemIdentifier = toolbarItemSpecs.first!.identifier

		window?.showsToolbarButton = false
		window?.toolbar = toolbar

		window?.setFrameAutosaveName(windowFrameName)
		
		switchToViewAtIndex(0)
	}

	// MARK: Actions

	func toolbarItemClicked(_ sender: AnyObject) {


	}

	// MARK: NSToolbarDelegate

	func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: String, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {

		guard let toolbarItemSpec = toolbarItemSpecs.first(where: { $0.identifier == itemIdentifier }) else {
			return nil
		}

		let toolbarItem = NSToolbarItem(itemIdentifier: toolbarItemSpec.identifier)
		toolbarItem.action = #selector(toolbarItemClicked(_:))
		toolbarItem.target = self
		toolbarItem.label = toolbarItemSpec.name
		toolbarItem.paletteLabel = toolbarItem.label
		toolbarItem.image = NSImage(named: toolbarItemSpec.imageName)

		return toolbarItem
	}

	func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [String] {

		return toolbarItemSpecs.map { $0.identifier }
	}

	func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [String] {

		return toolbarDefaultItemIdentifiers(toolbar)
	}

	func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar) -> [String] {

		return toolbarDefaultItemIdentifiers(toolbar)
	}
}

private extension PreferencesWindowController {

	var currentView: NSView? {
		get {
			return window?.contentView?.subviews.first
		}
	}

	func toolbarItemSpec(for identifier: String) -> PreferencesToolbarItemSpec? {

		return toolbarItemSpecs.first(where: { $0.identifier == identifier })
	}

	func switchToViewAtIndex(_ index: Int) {

		let identifier = toolbarItemSpecs[index].identifier
		switchToView(identifier: identifier)
	}

	func switchToView(identifier: String) {

		guard let toolbarItemSpec = toolbarItemSpec(for: identifier) else {
			assertionFailure("Preferences window: no toolbarItemSpec matching \(identifier).")
			return
		}

		guard let newViewController = viewController(identifier: identifier) else {
			assertionFailure("Preferences window: no view controller matching \(identifier).")
			return
		}
		
		if newViewController.view == currentView {
			return
		}

		newViewController.view.nextResponder = newViewController
		newViewController.nextResponder = window!.contentView

		window!.title = toolbarItemSpec.name

		resizeWindow(toFitView: newViewController.view)

		if let currentView = currentView {
			window!.contentView?.replaceSubview(currentView, with: newViewController.view)
		}
		else {
			window!.contentView?.addSubview(newViewController.view)
		}

		window!.makeFirstResponder(newViewController.view)
	}

	func viewController(identifier: String) -> NSViewController? {

		if let cachedViewController = viewControllers[identifier] {
			return cachedViewController
		}

		let storyboard = NSStoryboard(name: "Preferences", bundle: nil)
		guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? NSViewController else {
			assertionFailure("Unknown preferences view controller: \(identifier)")
			return nil
		}

		viewControllers[identifier] = viewController
		return viewController
	}
	
	func resizeWindow(toFitView view: NSView) {
		
		let viewFrame = view.frame
		let windowFrame = window!.frame
		let contentViewFrame = window!.contentView!.frame
		
		let deltaHeight = NSHeight(contentViewFrame) - NSHeight(viewFrame)
		let heightForWindow = NSHeight(windowFrame) - deltaHeight
		let windowOriginY = NSMinY(windowFrame)// + deltaHeight
		
		var updatedWindowFrame = windowFrame
		updatedWindowFrame.size.height = heightForWindow
		updatedWindowFrame.origin.y = windowOriginY
		updatedWindowFrame.size.width = NSWidth(viewFrame)
		
		var updatedViewFrame = viewFrame
		updatedViewFrame.origin = NSZeroPoint
		if viewFrame != updatedViewFrame {
			view.frame = updatedViewFrame
		}
		
		if windowFrame != updatedWindowFrame {
			window!.setFrame(updatedWindowFrame, display: true, animate: true)
		}
	}
}
