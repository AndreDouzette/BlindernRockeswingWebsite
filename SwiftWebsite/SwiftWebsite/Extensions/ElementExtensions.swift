//
//  ElementExtensions.swift
//  SwiftWebsite
//
//  Created by Andre Douzette on 17/12/2019.
//  Copyright © 2019 Andre Douzette. All rights reserved.
//

import Foundation
import Plot

public extension Node where Context: HTML.BodyContext {
	static func container(_ options: ContainerOptions? = nil, _ `class`: ClassElement? = nil, _ nodes: Node<HTML.BodyContext>...) -> Node {
		var cls = "container " + (options?.value ?? "")
		if cls != "" {
			cls += " "
		}
		cls += `class`?.value ?? ""
		
		return .div(.class(cls), .group(nodes))
	}
	
	static func containerFluid(_ options: ContainerOptions? = nil, _ `class`: ClassElement? = nil, _ nodes: Node<HTML.BodyContext>...) -> Node {
		var cls = "container-fluid " + (options?.value ?? "")
		if cls != "" {
			cls += " "
		}
		cls += `class`?.value ?? ""
		
		return .div(.class(cls), .group(nodes))
	}
	
	static func font(size: String, _ nodes: Node<HTML.BodyContext>...) -> Node {
		.element(named: "font", nodes: [.attribute(named: "size", value: size), .group(nodes)])
	}
	
	static func font(attributes: [String: String], _ nodes: Node<HTML.BodyContext>...) -> Node {
		var nodes = nodes
		for (key, value) in attributes {
			nodes.append(.attribute(named: key, value: value))
		}
		return .element(named: "font", nodes: nodes)
	}
}

//TODO: Can remove this?
public extension Node where Context == HTML.TableContext {
	static func tbody(_ nodes: Node<HTML.TableContext>...) -> Node {
		.element(named: "tbody", nodes: nodes)
	}
}

public struct ContainerOptions {
	var xl: Int? = nil
	var lg: Int? = nil
	var md: Int? = nil
	var sm: Int? = nil
	var xs: Int? = nil
	var offsetXl: Int? = nil
	var offsetLg: Int? = nil
	var offsetMd: Int? = nil
	var offsetSm: Int? = nil
	var offsetXs: Int? = nil
	
	var value: String {
		var v = [""]
		if let xl = xl {
			v.append("col-xl-\(xl)")
		}
		if let lg = lg {
			v.append("col-lg-\(lg)")
		}
		if let md = md {
			v.append("col-md-\(md)")
		}
		if let sm = sm {
			v.append("col-sm-\(sm)")
		}
		if let xs = xs {
			v.append("col-xs-\(xs)")
		}
		if let offsetXl = offsetXl {
			v.append("offset-xl-\(offsetXl)")
		}
		if let offsetLg = offsetLg {
			v.append("offset-lg-\(offsetLg)")
		}
		if let offsetMd = offsetMd {
			v.append("offset-md-\(offsetMd)")
		}
		if let offsetSm = offsetSm {
			v.append("offset-sm-\(offsetSm)")
		}
		if let offsetXs = offsetXs {
			v.append("offset-xs-\(offsetXs)")
		}
		return v.joined(separator: " ")
	}
	
	static func col(xl: Int? = nil,
					lg: Int? = nil,
					md: Int? = nil,
					sm: Int? = nil,
					xs: Int? = nil,
					offsetXl: Int? = nil,
					offsetLg: Int? = nil,
					offsetMd: Int? = nil,
					offsetSm: Int? = nil,
					offsetXs: Int? = nil) -> ContainerOptions {
		return .init(xl: xl,
					 lg: lg,
					 md: md,
					 sm: sm,
					 xs: xs,
					 offsetXl: offsetXl,
					 offsetLg: offsetLg,
					 offsetMd: offsetMd,
					 offsetSm: offsetSm,
					 offsetXs: offsetXs)
	}
}

public struct ClassElement {
	let value: String
	public static func `class`(_ value: String) -> ClassElement {
		return .init(value: value)
	}
}
