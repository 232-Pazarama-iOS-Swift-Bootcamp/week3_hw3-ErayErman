import UIKit

final class MovieMainVC: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var movieResponse: MovieResponse? {
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
        
        
    }
    
    // MARK: - SetupUI
    
    func setupMoviesUI(){
        title = "Movies"
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Action, Comedy..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navFavItem()
        fetchMovies()
    }
    // MARK: - Methods
    private func fetchMovies(with text: String = "Movie") {
        networkService.request(MovieRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.movieResponse = response
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
extension MovieMainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = MovieDetailVC()
        detailViewController.movie = movieResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MovieMainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PodcastCollectionViewCell
        let movie = movieResponse?.results?[indexPath.row]
        cell.title = movie?.trackName
        cell.imageView.downloadImage(from: movie?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MovieMainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMovies(with: text)
        }
    }
}


