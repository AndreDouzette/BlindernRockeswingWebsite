import Foundation
import AppKit
import Plot

func makeOmOss() {
	let page = WebPage(title: "Om oss", filename: "omoss.html")
	
	let brsMarkdown = Markdown.parse(markdown: Markdown.readMarkdown(file: "OmOss.md")!)
	
	let brs = Node<HTML.BodyContext>.raw(brsMarkdown)
	
	page.build(.container(.col(xl: 7, lg: 9, md: 10, sm: 12, xs: 12), .class("mainContainer"),
						  .container(.col(md: 10, offsetMd: 1), nil, brs),
						  .hr(),
						  styret(),
						  .hr(),
						  samarbeidspartnere()))
	Website.shared += page
}

fileprivate func samarbeidspartnere() -> Node<HTML.BodyContext> {
	.containerFluid(.col(md: 10, offsetMd: 1, offsetSm: 0), nil,
					.div(.class("row"),
						 .h1("Samarbeidspartnere og sponsorer"),
						 komogdans(),
						 foreningforalle(),
                         kulturstyret()))
}

fileprivate func samarbeid(title: String, content: Node<HTML.BodyContext>, image: String, link: String) -> Node<HTML.BodyContext> {
	.div(.class("row"),
	.container(.col(md: 8, sm: 12, xs: 12), nil,
			   .h3(.text(title)),
			   content),
	.container(.col(md: 4, sm: 4, xs: 4), nil,
			   .a(.target(.blank), .href(link),
				  .img(.src(image), .alt(title), .attribute(named: "width", value: "100%"), .class("d-none d-sm-block")),
				  .img(.src(image), .alt(title), .attribute(named: "width", value: "50%"), .class("d-sm-none")))))
}

fileprivate func komogdans() -> Node<HTML.BodyContext> {
	samarbeid(title: "Kom og Dans",
			  content: .p(.a("Kom og Dans", .href("https://www.komogdans.no")), .text(" er landets største aktør innen kursdrift i swingdans. De har drevet kursvirksomhet og utvikling av pedagogisk dansemusikk og folkelige swingformer i flere tiår, og er verdensledende på sitt område. Alle instruktørene vi bruker er godkjente instruktører leid fra Kom og Dans. Dette forsikrer at instruktørene er faglige oppdaterte og leverer kurs av høy kvalitet. Siden vi driver et nært sammarbeid med Kom og Dans, gjør det at vi kan tilby studenter kurs i folkelige swingformer til en studentvennlig pris.")),
			  image: "img/kod.png",
			  link: "http://www.komogdans.no")
}

fileprivate func foreningforalle() -> Node<HTML.BodyContext> {
	samarbeid(title: "Velkommen",
		content: .p(.text("Vi er medlem av "),
		.a("Velkommen", .href("https://www.sio.no/foreninger/velkommen")),
		.text(", som er et prosjekt ledet av SiO for å inkludere flere studenter i foreningslivet under studietiden. Foreninger som er medlem av Velkommen er ekstra flinke til å inkludere og ta i mot nye medlemmer.")),
		image: "img/velkommen.png",
		link: "https://www.sio.no/foreninger/velkommen")
}

fileprivate func kulturstyret() -> Node<HTML.BodyContext> {
    samarbeid(title: "Velferdstingets kulturstyre",
        content: .p(.text("Blindern Rockeswing mottar økonomisk støtte fra "),
        .a("velferdstingets kulturstyre", .href("https://www.studentvelferd.no/kulturstyret/")),
        .text(" for å kunne gjennomføre vår aktivitet, og samtidig holde medlemskontingenten for studentmedlemmer lav.")),
        image: "img/kulturstyret.png",
        link: "https://www.studentvelferd.no/kulturstyret/")
}

fileprivate func styret() -> Node<HTML.BodyContext> {
	let items = [styret(possisjon: "Leder", navn: "Vanja Hallvig", img: "vanja.jpg"),
				 styret(possisjon: "Nestleder", navn: "Ylva Thorvaldsen", img: "ylva.jpg"),
                 styret(possisjon: "Medlemsansvarlig", navn: "Ole Arne Steen", img: "oleArne.jpeg"),
                 styret(possisjon: "Kasserer", navn: "Henning Kjøsnes", img: "henning.jpg"),
                 styret(possisjon: "Arrangementansvarlig", navn: "Kjersti Wergeland Krakhella", img: "kjersti.jpg"),
                 styret(possisjon: "Frivilligkoordinator", navn: "Silje Holm Sørensen", img: "silje.jpg"),
                 styret(possisjon: "Markedsføringsansvarlig", navn: "Sophie Beichmann", img: "sophie.jpg"),
                 styret(possisjon: "Sponsoransvarlig", navn: "Nicklas Moseng", img: "nicklas.jpg"),
				 styret(possisjon: "IT- og fagansvarlig", navn: "André Douzette", img: "andre.jpg")]
	
	var rows: [Node<HTML.BodyContext>] = []
	for i in 0..<(items.count/2) {
		let first = items[2*i]
		let second = items[2*i + 1]
		rows.append(.div(.div(.class("row"), first, second), .br()))
	}
	if items.count%2 == 1 {
		rows.append(.div(.class("row"), items.last!))
	}
	return .containerFluid(.col(md: 10, offsetMd: 1, offsetSm: 0), nil, .h1("Styret høsten 2022"), .group(rows))
}

fileprivate let styretDirUrl = URL(filePath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .appending(path: "dist/img/styret")

fileprivate func styret(possisjon: String, navn: String, img: String) -> Node<HTML.BodyContext> {
    let imgSrc = "img/styret/\(img)"
    let ratio = (NSImage(contentsOf: styretDirUrl.appending(component: img))?.size).map { min(1, $0.width/$0.height) } ?? 1
    let smallRatioString = String(format: "%.1f", 75*ratio) + "%"
    let largeRatioString = String(format: "%.1f", 40*ratio) + "%"
    
	return .container(.col(md: 6, sm: 12, offsetMd: 0, offsetSm: 2, offsetXs: 2), nil,
			   .p(.br()),
			   .div(.class("row"), .h2(.text(possisjon))),
			   .div(.class("row"), .text(navn)),
			   .img(.src(imgSrc), .attribute(named: "width", value: smallRatioString), .class("d-none d-md-block")),
			   .img(.src(imgSrc), .attribute(named: "width", value: largeRatioString), .class("d-md-none")))
}
