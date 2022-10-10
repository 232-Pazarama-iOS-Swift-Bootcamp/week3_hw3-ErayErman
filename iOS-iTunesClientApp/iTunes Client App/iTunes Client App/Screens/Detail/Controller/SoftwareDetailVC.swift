import UIKit

final class SoftwareDetailVC: UIViewController {
    var addedFav = false
    var software: Software? {
        didSet {
            title = software?.trackName
            detailView.imageView.downloadImage(from: software?.artworkLarge)
            detailView.releaseDate = software?.releaseDate
            detailView.artistName = software?.artistName
            detailView.country = software?.country
            detailView.genres = software?.genres?.reduce("") { $1 + ", " + $0 }
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
