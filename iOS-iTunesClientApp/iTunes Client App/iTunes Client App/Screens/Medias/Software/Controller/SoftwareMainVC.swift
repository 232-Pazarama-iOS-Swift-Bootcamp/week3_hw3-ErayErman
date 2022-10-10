
import UIKit

final class SoftwareMainVC: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var softwareResponse: SoftwareResponse? {
        didSet {
            mainView.refresh()
        }
    }
   
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        setupSoftwareUI()
        //MainViewController().sharedItem.navFavItem()

        
    }
    
    // MARK: - SetupUI
    
    func setupSoftwareUI(){
        title = "Software"
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "App, Tool..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navFavItem()
        fetchSoftwares()
    }
    // MARK: - Methods
    private func fetchSoftwares(with text: String = "Software") {
        networkService.request(SoftwareRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.softwareResponse = response
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
extension SoftwareMainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = SoftwareDetailVC()
        detailViewController.software = softwareResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension SoftwareMainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        softwareResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let software = softwareResponse?.results?[indexPath.row]
        cell.title = software?.trackName
        cell.imageView.downloadImage(from: software?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension SoftwareMainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchSoftwares(with: text)
        }
    }
}

