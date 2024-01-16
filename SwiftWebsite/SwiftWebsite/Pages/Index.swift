//
//  Index.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 16/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

func makeIndex() {
	let index = WebPage(title: "Hjem", filename: "index.html")
	let facebookPage =  readProjectFile(relativePath: "HTML/facebookIndex.html")!
	let markdownContent = Markdown.parse(markdown: Markdown.readMarkdown(file: "index.md")!)
	index.build(
		.container(.col(xl: 8, lg: 10, md: 10, sm: 12, xs: 12), .class("mainContainer"),
			 .div(.class("row"),
				  .container(.col(xl: 5, lg: 5, md: 5, sm: 12, xs: 12), .class("d-none d-lg-block"),
					   hvaskjer(),
					   .br(),
					   .raw(facebookPage)),
				  .container(.col(xl: 7, lg: 7, md: 7, sm: 12, xs: 12), nil,
					   .br(),
					   .raw(markdownContent),
					   .div(.class("d-lg-none"),
							.hr(),
							hvaskjer(),
							.br(),
							.raw(facebookPage))))))
	Website.shared += index
}


func hvaskjerItem(dato: String, tittel: String, link: String? = nil) -> Node<HTML.BodyContext> {
	var text: Node<HTML.BodyContext> = .text(tittel)
	if let link = link {
		text = .a(.href(link), .text(tittel), .style("color: black;"))
	}
	return .group(.i(.b(text), .font(size: "-0.5", .text(dato))), .text(" "), .br())
}

func hvaskjer() -> Node<HTML.BodyContext> {
	.group(.h3("Arrangementer høsten 2023"),
           hvaskjerItem(dato: "24. februar", tittel: "Bli-kjent-fest", link: "https://www.facebook.com/events/369595942269897/"),
           hvaskjerItem(dato: "23. mars", tittel: "Slottsrock", link: "https://www.facebook.com/events/1031888324748337/")
	)
}
