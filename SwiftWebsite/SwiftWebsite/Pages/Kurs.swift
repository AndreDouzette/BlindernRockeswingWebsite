//
//  Kurs.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 16/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

func makeKurs() {
	let page = MarkdownPage(title: "Kurs", filename: "kurs.html", markdownFile: "kurs.md")
	Website.shared += page
}
