import Foundation

func makeÅrsmøtet2020() {
    let page = MarkdownPage(title: nil, filename: "arsmotet2020.html", markdownFile: "Årsmøter/årsmøtet2020.md")
    Website.shared += page
}

func makeÅrsmøtet2022() {
    let page = MarkdownPage(title: nil, filename: "arsmotet2022.html", markdownFile: "Årsmøter/årsmøtet2022.md")
    Website.shared += page
}

func makeReferatÅrsmøtet2022() {
    let page = MarkdownPage(title: nil, filename: "arsmotet2022referat.html", markdownFile: "Årsmøter/ReferatÅrsmøtet2022.md")
    Website.shared += page
}

func makeÅrsmøtet2023() {
    let page = MarkdownPage(title: nil, filename: "arsmotet2023.html", markdownFile: "Årsmøter/årsmøtet2023.md")
    Website.shared += page
}
