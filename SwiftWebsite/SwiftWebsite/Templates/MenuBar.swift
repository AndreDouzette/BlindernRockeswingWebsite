//
//  BodyHead.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 11/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

fileprivate func menuItem(_ item: MenuItem, selected: Bool) -> Node<HTML.ListContext> {
	var clz = "nav-item"
	var textAttributes: [Node<HTML.BodyContext>] = [.attribute(named: "size", value: "+2")]
	if selected {
		clz += " active"
		textAttributes.append(.attribute(named: "color", value: "red"))
		
		return .li(.class(clz),
		.element(named: "font", nodes:[
		 .group(textAttributes),
		 .b(
		 .a(.class("nav-link"),
			.href(item.link),
			.text(item.title!)))]))
	}
	return .li(.class(clz),
			   .element(named: "font", nodes:[
				.group(textAttributes),
				.a(.class("nav-link"),
				   .href(item.link),
				   .text(item.title!))]))
}

fileprivate func menuItems(_ items: [MenuItem], selection: MenuItem) -> Node<HTML.BodyContext> {
	let listNodes = items.filter{$0.title != nil}.map {
		menuItem($0, selected: $0.filename == selection.filename)
	}
	return .ul(.class("navbar-nav"), .group(listNodes))
}

fileprivate func facebookButton(_ nodes: Node<HTML.AnchorContext>...) -> Node<HTML.BodyContext> {
	.a(.href("https://www.facebook.com/blindernrockeswing"),
	   .group(nodes),
		.style("padding: 0px"),
		.img(.src("img/facebook.png"),
			 .alt("facebook"),
			 .attribute(named: "height", value: "32px")))
}

fileprivate func instagramButton(_ nodes: Node<HTML.AnchorContext>...) -> Node<HTML.BodyContext> {
    .a(.href("https://www.instagram.com/blindernrockeswingoslo"),
       .group(nodes),
        .style("padding-right: 12px"),
        .img(.src("img/instagram.png"),
             .alt("instagram"),
             .attribute(named: "height", value: "32px")))
}

func navbarButton() -> Node<HTML.BodyContext> {
	return .button(.class("navbar-toggler"),
				   .type("button"),
				   .dataToggle("collapse"),
				   .dataTarget("#navbarSupportedContent"),
				   .ariaControls("navbarSupportedContent"),
				   .ariaExpanded(false),
				   .ariaLabel("Toggle navigation"),
				   .span(.class("navbar-toggler-icon")))
}

func menuBar(items: [MenuItem], selection: MenuItem) -> Node<HTML.BodyContext> {
	.nav(
	.class("navbar navbar-expand-md navbar-dark bg-dark"),
		 .container(
            .col(xl: 10, lg: 12, md: 12, sm: 12, xs: 12), nil,
            .container(
                .col(xl: 11, lg: 11, md: 12, sm: 12, xs: 12, offsetXl: 2, offsetLg: 1, offsetMd: 0), nil,
                navbarButton(),
                .div(
                    instagramButton(.class("d-md-none")),
                    facebookButton(.class("d-md-none"))
                ),
                .div(
                    .class("collapse navbar-collapse"),
                    .id("navbarSupportedContent"),
                    menuItems(items, selection: selection)
                ),
                instagramButton(.class("d-none d-lg-block")),
                facebookButton(.class("d-none d-lg-block"))
            )
         )
    )
}
