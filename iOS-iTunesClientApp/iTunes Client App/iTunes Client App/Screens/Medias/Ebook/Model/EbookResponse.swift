import Foundation

struct EbookResponse: Decodable {
    let resultCount: Int?
    let results: [Ebook]?
}

