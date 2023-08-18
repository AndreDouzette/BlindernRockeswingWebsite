//
//  Medlemskap.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 18/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation

func makePriser() {
	let page = MarkdownPage(title: "Priser", filename: "priser.html", markdownFile: "priser.md")
	
	page.insert(at: "pristabell medlemskap", table([
		["Medlemskap student", "kr. 400,-"],
		["Medlemskap ikke-student", "kr. 1900,-"]],
        firstColumnBold: true
        ))
    
    page.insert(at: "pristabell kurs", table([
        ["Grunnkursrekke, ikke-medlem", "kr. 900,-"],
        ["Drop-in, ikke-medlem", "kr. 300,-"]],
        firstColumnBold: true
    ))
	
	Website.shared += page
}
