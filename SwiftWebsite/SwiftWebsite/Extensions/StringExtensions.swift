//
//  StringExtensions.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 18/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

extension String {
	func match(regex: String, groups: [Int]) -> [[String]] {
		guard let regex = try? NSRegularExpression(pattern: regex) else {
			return []
		}
		let range = NSRange(location: 0, length: utf16.count)
		let matches = regex.matches(in: self, options: [], range: range)
		return matches.map {
			var values = [String]()
			for group in groups {
				let startIndex = index(self.startIndex, offsetBy: $0.range(at: group).lowerBound)
				let endIndex = index(self.startIndex, offsetBy: $0.range(at: group).upperBound)
				values.append(String(self[startIndex..<endIndex]))
			}
			return values
		}
	}
	
	func match(regex: String) -> [String] {
		match(regex: regex, groups: [0]).map{$0[0]}
	}
	
	func between(_ first: String?, and second: String?) -> String {
		guard let first = first, let firstRange = range(of:first) else {
			guard let second = second, let secondRange = range(of:second) else {
				return self
			}
			let secondIndex = secondRange.lowerBound
			return String(self[startIndex..<secondIndex])
		}
		let firstIndex = firstRange.upperBound
		guard let second = second, let secondRange = range(of:second) else {
			return String(self[firstIndex...])
		}
		let secondIndex = secondRange.lowerBound
		return String(self[firstIndex..<secondIndex])
	}
}
