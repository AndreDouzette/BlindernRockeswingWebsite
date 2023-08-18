//
//  Head.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 11/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

func head() -> Node<HTML.DocumentContext> {
	.head(
		.meta(.charset(.utf8)),
		.meta(.name("viewport"),
			  .content("width=device-width, initial-scale=1, shrink-to-fit=no")),
		.link(.rel(.stylesheet),
			  .href("https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"),
			  .attribute(named: "integrity", value: "sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"),
			  .attribute(named: "crossorigin", value: "anonymous")),
		.title("Blindern Rockeswing"),
		.meta(.name("description"),
			  .content("Studentforening på UiO som arrangerer kurs og sosialdans innen swing og rock'n roll.")),
		.link(.rel(.stylesheet),
			  .type("text/css"),
			  .href("css/body.css")),
		.link(.rel(.stylesheet),
			  .href("css/markdown.css")),
		.link(.rel(.shortcutIcon),
			  .href("/img/site.ico")),
		.raw(readProjectFile(relativePath: "HTML/facebookPixel.html")!),
		.raw(#"<meta name="facebook-domain-verification" content="k0w4bdpou7kpjtwoqudt8anwf0wvad" />"#)
	)
}
