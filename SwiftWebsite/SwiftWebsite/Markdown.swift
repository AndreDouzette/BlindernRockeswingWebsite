//
//  Markdown.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 19/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Ink

class Markdown {
	var content: String
	var placeholders: [String: String] = [:]
	var marks: [String: String] = [:]

	convenience init(fromFile markdownFile: String) {
		self.init(content: Self.readMarkdown(file: markdownFile) ?? "")
	}

	init(content: String) {
		self.content = content
		placeholders = comments(in: content, regex: #"\{#(.*)#\}"#)
		marks = comments(in: content, regex: #"\{@(.*)@\}"#)
	}

	func insert(content newContent: String, for identifier: String) {
		guard let placeholder = placeholders[identifier] else {
			print("nope \(identifier)")
			return
		}
		content = content.replacingOccurrences(of: placeholder, with: newContent)
	}
	
	func parse() -> String {
		MarkdownParser().html(from: content)
	}
}

extension Markdown {
	static func readMarkdown(file: String) -> String? {
		var filepath = file
		if filepath.split(separator: ".").last != "md" {
			filepath += ".md"
		}
		return readProjectFile(relativePath: "Markdown/\(filepath)")
	}

	static func parse(markdown: String) -> String {
		MarkdownParser().html(from: markdown)
	}
}

fileprivate func comments(in content: String, regex: String) -> [String: String] {
	let matches = content.match(regex: regex, groups: [0, 1])
	var comments = [String: String]()
	for match in matches {
		let key = String(match[1].trimmingCharacters(in: .whitespaces))
		let value = String(match[0])
		comments[key] = value
	}
	return comments
}
