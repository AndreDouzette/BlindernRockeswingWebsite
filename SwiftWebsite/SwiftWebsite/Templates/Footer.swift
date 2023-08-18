//
//  Footer.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 11/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

func footer() -> Node<HTML.BodyContext> {
	.group(
		.div(.class("container"),
			 .div(.class("row"), .p()),
			 .div(.class("row"), .p())),
		.script(.src("https://code.jquery.com/jquery-3.4.1.slim.min.js"),
				.attribute(named: "integrity", value: "sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"),
				.attribute(named: "crossorigin", value: "anonymous")),
		.script(.src("https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"),
				.attribute(named: "integrity", value: "sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"),
				.attribute(named: "crossorigin", value: "anonymous")),
		.script(.src("https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"),
				.attribute(named: "integrity", value: "sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"),
				.attribute(named: "crossorigin", value: "anonymous")),
		.footer(.class("footer"),
			.div(.class("container-fluid"),
				 .style("background-color: #2B2B2B;"),
				 .div(.class("container"),
					  .div(.class("row"),
						   .div(.class("container col-md-3 col-sm-11 col-xs-11"),
								.h4("Kontakt",
									.class("text-muted")),
								.p(.span("post@blindernrockeswing.no", .class("text-muted")))),
						   .div(.class("container col-md-9 col-sm-1"),
								.p()))))))
}
