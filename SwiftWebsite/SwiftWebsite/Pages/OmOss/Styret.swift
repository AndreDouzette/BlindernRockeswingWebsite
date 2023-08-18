//
//  styret.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 14/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

func styretItem(position: String, name: String, imageFilepath: String) -> Node<HTML.BodyContext> {
	.div(.class("media"),
		 .div(.class("media-left media-middle col-md-3 col-xs-4"),
			  .img(.src(imageFilepath), .attribute(named: "width", value: "100%"))),
		 .div(.class("media-body"),
			  .h2(.class("media-heading"),
				  .text(position)),
			  .p(.text(name))))
}
