

import UIKit

final class EbookDetailVC: UIViewController {
    var addedFav = false
    var ebook: Ebook? {
        didSet {
            title = ebook?.trackName
            detailView.imageView.downloadImage(from: ebook?.artworkLarge)
            detailView.releaseDate = ebook?.releaseDate
            detailView.artistName = ebook?.artistName
            detailView.country = ebook?.country
            detailView.genres = ebook?.genres?.reduce("") { $1 + ", " + $0 }
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
