import Foundation
import Plot

//func makeArrangementer() {
//	let page = MarkdownPage(title: "Arrangementer", filename: "arrangementer.html", markdownFile: "arrangementer.md")
//	Website.shared += page
//}

func makeArrangementer() {
	let index = WebPage(title: "Arrangementer", filename: "arrangementer.html")
	let facebookPage =  readProjectFile(relativePath: "HTML/facebookArrangementer.html")!
	let markdown = Markdown(fromFile: "arrangementer.md")
	
	markdown.insert(content: Node<HTML.BodyContext>
		.div(.class("d-lg-none"),
			 .br(),
			 .raw(facebookPage),
			 .p(.br()))
		.render(indentedBy: .tabs(1)), for: "facebookarrangementer")
	
	let markdownContent = markdown.parse()
	
	index.build(
		.container(.col(xl: 8, lg: 10, md: 10, sm: 12, xs: 12), .class("mainContainer"),
			 .div(.class("row"),
				  .container(.col(xl: 5, lg: 5, md: 5, sm: 12, xs: 12), .class("d-none d-lg-block"),
					   .raw(facebookPage)),
				  .container(.col(xl: 7, lg: 7, md: 12, sm: 12, xs: 12), nil,
					   .br(),
				.raw(markdownContent)))))
	Website.shared += index
}
