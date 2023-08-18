//
//  faq.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 15/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

func makeFaq() {
	let page = MarkdownPage(title: "FAQ", filename: "faq.html", markdownFile: "faq.md")
	Website.shared += page
}
