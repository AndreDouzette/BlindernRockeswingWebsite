//
//  styreverv.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 19/01/2020.
//  Copyright © 2020 Andre Douzette. All rights reserved.
//

import Foundation

func makeStyreverv() {
	let page = MarkdownPage(title: nil, filename: "styreverv.html", markdownFile: "styreverv.md")
	Website.shared += page
}
