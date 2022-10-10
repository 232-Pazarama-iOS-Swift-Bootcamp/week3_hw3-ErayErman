
import Foundation

struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}

