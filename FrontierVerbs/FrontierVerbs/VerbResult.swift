//
//  VerbResult.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct VerbResult {

	static let empty = VerbResult(value: nil, error: nil)
	static let verbNotFound = VerbResult(error: LangError(.verbNotFound))
	static let tooManyParams = VerbResult(error: LangError(.tooManyParams))
	static let tooFewParams = VerbResult(error: LangError(.tooFewParams))
	static let notImplemented = VerbResult(error: LangError(.notImplemented))
	static let noLongerImplemented = VerbResult(error: LangError(.noLongerImplemented))
	static let verbTrue = VerbResult(value: true)
	static let verbFalse = VerbResult(value: false)
	
	let value: Any?
	let error: LangError?
	
	init(value: Any) {
		
		self.init(value: value, error: nil)
	}

	init(error: LangError) {
		
		self.init(value: nil, error: error)
	}
	
	init(value: Any?, error: LangError?) {
		
		self.value = value
		self.error = error
	}
}
