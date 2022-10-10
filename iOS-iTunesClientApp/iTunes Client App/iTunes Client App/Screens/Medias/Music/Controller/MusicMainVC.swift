import UIKit

final class MusicMainVC: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var musicResponse: MusicResponse? {
        didSet {
            mainView.refresh()
        }
    }
   
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        setupMusicUI()
        
        
    }
    
    // MARK: - SetupUI
    
    func setupMusicUI(){
        title = "Music"
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Rock, R&B..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navFavItem()
        fetchMusics()
    }
    // MARK: - Methods
    private func fetchMusics(with text: String = "Music") {
        networkService.request(MusicRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.musicResponse = response
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
extension MusicMainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = MusicDetailVC()
        detailViewController.music = musicResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MusicMainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        musicResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let music = musicResponse?.results?[indexPath.row]
        cell.title = music?.trackName
        cell.imageView.downloadImage(from: music?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MusicMainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMusics(with: text)
        }
    }
}

