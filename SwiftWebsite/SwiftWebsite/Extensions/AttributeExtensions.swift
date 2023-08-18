//
//  AttributeExtensions.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 16/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Plot

public extension Node where Context: HTMLNamableContext {
	static func type(_ type: String) -> Node {
        .attribute(named: "type", value: type)
    }
	
	static func dataToggle(_ dataToggle: String) -> Node {
        .attribute(named: "data-toggle", value: dataToggle)
    }
	
	static func dataTarget(_ dataTarget: String) -> Node {
        .attribute(named: "data-target", value: dataTarget)
    }
}
