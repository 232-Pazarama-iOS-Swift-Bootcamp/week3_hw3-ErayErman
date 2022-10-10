import UIKit

final class MovieDetailVC: UIViewController {
    var addedFav = false
    var movie: Movie? {
        didSet {
            title = movie?.trackName
            detailView.imageView.downloadImage(from: movie?.artworkLarge)
            detailView.releaseDate = movie?.releaseDate
            detailView.artistName = movie?.artistName
            detailView.country = movie?.country
            detailView.genres = movie?.genres?.reduce("") { $1 + ", " + $0 }
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
