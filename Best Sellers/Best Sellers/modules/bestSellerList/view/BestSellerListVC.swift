//
//  BestSellerListVC.swift
//  Best Sellers MVP
//
//  Created by Eduardo Herzer on 20/11/20.
//

import UIKit

class BestSellerListVC: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewErrorMessage: UIView!
    @IBOutlet weak var lbErrorMessage: UILabel!
    
    private let cellIdentifier = "BestSellerCell"
    private var bestSellers = [BestSeller]()
    
    private var presenter: BestSellerPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = BestSellerPresenter(view: self, service: BestSellerService())
        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        self.activityIndicator.startAnimating()
        presenter.loadBestSellers()
    }
    
    @IBAction func btnTryAgainClicked(_ sender: Any) {
        self.activityIndicator.startAnimating()
        presenter.loadBestSellers()
    }
}

extension BestSellerListVC: BestSellerViewProtocol {
    func listLoaded(bestSellers: [BestSeller]) {
        self.bestSellers = bestSellers
        self.collectionView.reloadData()
        
        self.viewErrorMessage.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        self.lbErrorMessage.text = message
        self.viewErrorMessage.isHidden = false
        self.activityIndicator.stopAnimating()
    }
}

extension BestSellerListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        if let cell = cell as? BestSellerCell {
            let bestSeller = bestSellers[indexPath.row]
            
            cell.lbTitle.text = bestSeller.title
            cell.lbAuthor.text = bestSeller.author
            //TODO cell.imgCover.image = ;
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellers.count
    }
}

extension BestSellerListVC: UICollectionViewDelegate {
    //TODO
}
