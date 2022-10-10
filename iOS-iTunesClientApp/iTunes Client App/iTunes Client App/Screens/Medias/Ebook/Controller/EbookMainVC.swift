
import UIKit

final class EbookMainVC: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var ebookResponse: EbookResponse? {
        didSet {
            mainView.refresh()
        }
    }
   
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        setupMoviesUI()
        //MainViewController().sharedItem.navFavItem()
        
    }
    
    // MARK: - SetupUI
    
    func setupMoviesUI(){
        title = "Ebooks"
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Action, Comedy..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navFavItem()
        fetchEbooks()
    }
    // MARK: - Methods
    private func fetchEbooks(with text: String = "Ebook") {
        networkService.request(EbookRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.ebookResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    private func navFavItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorites", style: .plain, target: self, action: #selector(favItem))
    }
    @objc private func favItem(){
        let favController = favMainVC()
        let favNavigationController = UINavigationController(rootViewController: favController)
        navigationController?.present(favNavigationController, animated: true)    }
}

// MARK: - UICollectionViewDelegate
extension EbookMainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = EbookDetailVC()
        detailViewController.ebook = ebookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension EbookMainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ebookResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let ebook = ebookResponse?.results?[indexPath.row]
        cell.title = ebook?.trackName
        cell.imageView.downloadImage(from: ebook?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension EbookMainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchEbooks(with: text)
        }
    }
}


