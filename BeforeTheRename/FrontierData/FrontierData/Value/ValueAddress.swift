//
//  ValueAddress.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Address: Value {
	
	public var valueType: ValueType {
		get {
			return .address
		}
	}
}
