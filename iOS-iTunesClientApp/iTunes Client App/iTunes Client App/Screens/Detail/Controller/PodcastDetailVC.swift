
import UIKit
import CoreData

final class PodcastDetailVC: UIViewController {
    var addedFav = false
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        navFavItem()
    }
    private func navFavItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Favorite", style: .plain, target: self, action: #selector(favItem))
    }
    @objc private func favItem(){
        
        if !addedFav {
            navigationItem.rightBarButtonItem?.title = "Remove Favorite"
            addedFav = true
        }else {
            navigationItem.rightBarButtonItem?.title = "Add Favorite"
            addedFav = false
        }
    }
    
}
