
import Foundation

struct MovieResponse: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}
