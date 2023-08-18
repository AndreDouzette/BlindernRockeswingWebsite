//
//  MenuItem.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 16/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

struct MenuItem {
	let filename: String
	let link: String
	let title: String?
	
	init(title: String?, filename: String) {
		self.title = title
		self.filename = filename
		self.link = filename
	}
}
