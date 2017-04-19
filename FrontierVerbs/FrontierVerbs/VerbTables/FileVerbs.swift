//
//  FileVerbs.swift
//  FrontierVerbs
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

struct FileVerbs: VerbTable {
	
	private enum Verb: String {
		case x = "x"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .x:
			return x(params)
		}
	}
}

private extension FileVerbs {
	
	static func x(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
