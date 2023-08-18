//
//  Table.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 18/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

func table(_ values: [[String]], firstColumnBold: Bool = false) -> Node<HTML.BodyContext> {
	
	var tableRows: [Node<HTML.TableContext>] = []
	
	for row in values {
		var tableColumns: [Node<HTML.TableRowContext>] = []
		for column in row {
			if(row == values.first) {
				tableColumns.append(Node<HTML.TableRowContext>.td(.style("border: none"), (column == row.first && firstColumnBold) ? .b(.text(column)) : .text(column)))
			} else {
				tableColumns.append(Node<HTML.TableRowContext>.td((column == row.first && firstColumnBold) ? .b(.text(column)) : .text(column)))
			}
		}
		tableRows.append(.tr(.group(tableColumns)))
	}
	
	return .div(.class("row"),
				.container(.col(lg: 8, md: 10, sm: 12, xs: 12, offsetLg: 2, offsetMd: 1, offsetSm: 0, offsetXs: 0), nil,
						   .table(.class("table"),
								  .group(tableRows))))
}
