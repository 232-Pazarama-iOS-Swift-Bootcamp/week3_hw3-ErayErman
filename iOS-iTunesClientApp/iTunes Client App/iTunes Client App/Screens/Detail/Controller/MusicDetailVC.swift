
import UIKit

final class MusicDetailVC: UIViewController {
    var addedFav = false
    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.country = music?.country
            detailView.genres = music?.genres?.reduce("") { $1 + ", " + $0 }
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
