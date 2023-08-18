//
//  MarkdownPage.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 15/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

class MarkdownPage: WebPage {
	var markdownContent: Markdown
	var placeholders: [String: String] = [:]
	
	init(title: String? = nil, filename: String, markdownFile: String) {
		markdownContent = Markdown(fromFile: markdownFile)
		super.init(item: .init(title: title, filename: filename))
	}
	
	func insert(at identifier: String, _ content: Node<HTML.BodyContext>) {
		markdownContent.insert(content: content.render(indentedBy: .tabs(1)), for: identifier)
	}
	
	override func render(with menuItems: [MenuItem]) -> String {
		let htmlContent = markdownContent.parse()
			.replacingOccurrences(of: "<img src=", with: #"<img style="width: 100%" src="#)
		
		build(.div(.container(.col(xl: 7, lg: 9, md: 10, sm: 12, xs: 12), .class("mainContainer"), .br(), .container(.col(lg: 10, offsetLg: 1), nil, .raw(htmlContent)))))
		return super.render(with: menuItems)
	}
}
