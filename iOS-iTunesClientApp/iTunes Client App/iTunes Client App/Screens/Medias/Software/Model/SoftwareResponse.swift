
import Foundation

struct SoftwareResponse: Decodable {
    let resultCount: Int?
    let results: [Software]?
}
