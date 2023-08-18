//
//  Header.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 10/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

private func brsImage(width: String = "20%", margins: Bool = true) -> Node<HTML.AnchorContext> {
	if margins {
		return .img(.src("img/brs.png"),
			 .alt("Header"),
			 .attribute(named: "width", value: width),
			 .attribute(named: "style", value: "margin-top: 50px; margin-bottom: 10px"))
	} else {
		return .img(.src("img/brs.png"),
			 .alt("Header"),
			 .attribute(named: "width", value: width))
	}
}

private func header(_ configuration: String, image: String, logo: Node<HTML.AnchorContext>) -> Node<HTML.BodyContext> {
	.div(
		.class("\(configuration)"),
		.style("background: red; color: blue; background: url('\(image)'); background-position: center bottom; background-size: 100%"),
		 .div(
			.class("container"),
			.a(.href("/index.html"), logo)
		 )
	)
}

func header() -> Node<HTML.BodyContext> {
	.group(
		.raw(readProjectFile(relativePath: "HTML/facebookScript.html")!),
		.header(
			header("d-none d-lg-block", image: "img/backgroundLarge.jpg", logo: brsImage()),
			header("d-none d-sm-block d-lg-none", image: "img/backgroundMedium.jpg", logo: brsImage()),
			header("d-block d-sm-none", image: "img/backgroundSmall.jpg", logo: brsImage(width: "20%", margins: true))
		)
	)
}
