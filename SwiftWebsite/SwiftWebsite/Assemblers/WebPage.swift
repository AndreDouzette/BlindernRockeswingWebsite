//
//  WebPage.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 14/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

class WebPage {
	var item: MenuItem
	var nodes: [Node<HTML.BodyContext>]
	
	convenience init(title: String?, filename: String) {
		self.init(item: .init(title: title, filename: filename))
	}
	
	init(item: MenuItem) {
		self.item = item
		nodes = []
	}
	
	func build(_ nodes: Node<HTML.BodyContext>...) {
		self.nodes = nodes
	}
	
	private func renderToString(with menuItems: [MenuItem]) -> String? {
		return newTabExternalLinks(html: HTML(.lang(.norwegian),
					head(),
					.body(
						header(),
						menuBar(items: menuItems, selection: item),
						.group(nodes),
						footer()))
			.render(indentedBy: .tabs(1)))
	}
	
	@discardableResult
	func render(with menuItems: [MenuItem]) -> String {
		guard let renderedHtmlString = renderToString(with: menuItems) else {
			return ""
		}
		do {
			try renderedHtmlString
				.write(to: distDirectory.appendingPathComponent(item.filename),
					   atomically: true,
					   encoding: String.Encoding.utf8)
		} catch {
			print(error.localizedDescription)
		}
		return renderedHtmlString
	}
	
	func newTabExternalLinks(html: String) -> String {
		html.replacingOccurrences(of: #"<a href="http"#, with: #"<a target="_blank" href="http"#)
			.replacingOccurrences(of: #"<a href="www"#, with: #"<a target="_blank" href="www"#)
	}
}
