import Foundation

struct PodcastResponse: Decodable {
    let resultCount: Int?
    let results: [Podcast]?
}
