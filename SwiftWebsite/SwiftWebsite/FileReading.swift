//
//  ReadJavascript.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 13/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

let rootDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
	.deletingLastPathComponent()
	.deletingLastPathComponent()
	.deletingLastPathComponent()
	.appendingPathComponent("SwiftWebsite")

let distDirectory = rootDirectory
	.deletingLastPathComponent()
	.deletingLastPathComponent()
	.appendingPathComponent("dist")

func readProjectFile(relativePath: String) -> String? {
	var url = rootDirectory
	for component in relativePath.split(separator: "/") {
		url = url.appendingPathComponent(String(component))
	}
	do {
		return try String(contentsOfFile: url.path)
	} catch {
		print(error.localizedDescription)
		return nil
	}
}
