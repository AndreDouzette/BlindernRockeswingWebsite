//
//  Påmleding.swift
//  Påmleding
//
//  Created by Andre Douzette on 22/07/2021.
//  Copyright © 2021 Andre Douzette. All rights reserved.
//

import Foundation

func makePåmleding() {
	let page = WebPage(title: "Påmelding", filename: "pamelding.html")
	let form = readProjectFile(relativePath: "HTML/påmelding.html") ?? ""
	page.build(.raw(form))
	Website.shared += page
}
