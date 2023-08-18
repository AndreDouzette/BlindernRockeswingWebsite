//
//  Website.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 16/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

class Website {
	static let shared = Website()
	
	var pages: [WebPage] = []
	
	func add(page: WebPage) {
		pages.append(page)
	}
	
	func render() {
		let menuItems = pages.map {$0.item}.filter {$0.title != nil}
		for page in pages {
			page.render(with: menuItems)
		}
	}
	
	static func +=(left: Website, right: WebPage) {
		left.add(page: right)
	}
}
