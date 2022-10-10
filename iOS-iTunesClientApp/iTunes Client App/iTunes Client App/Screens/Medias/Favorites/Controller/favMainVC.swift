import UIKit
import CoreData


final class favMainVC: UIViewController {
    
    var favoriteData: [NSManagedObject] = []



    // MARK: - Properties
    private let mainView = FavMainView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        

        setupUI()

        
        
    }
    
    // MARK: - SetupUI
    
    private func setupUI(){
        title = "Favorites"
        //navFavItem()
    }
    // MARK: - Methods
    
    private func navFavItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorites", style: .plain, target: self, action: #selector(favItem))
    }
    @objc private func favItem(){
        let favController = favMainVC()
        let favNavigationController = UINavigationController(rootViewController: favController)
    }
}




// MARK: - UICollectionViewDelegate
extension favMainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = FavDetailVC()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension favMainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoriteData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let fav = favoriteData[indexPath.row]
        cell.title = fav.value(forKey: "trackName") as? String
        cell.imageView.downloadImage(from: fav.value(forKey: "artworkLarge") as? URL )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}


