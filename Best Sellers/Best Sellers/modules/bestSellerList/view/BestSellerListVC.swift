//
//  BestSellerListVC.swift
//  Best Sellers MVP
//
//  Created by Eduardo Herzer on 20/11/20.
//

import UIKit
import Kingfisher

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
            
            cell.lbTitle.text = bestSeller.title.capitalizingFirstLetter()
            cell.lbAuthor.text = bestSeller.author
            cell.imgCover.kf.setImage(with: URL(string: bestSeller.book_image))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellers.count
    }
}

extension BestSellerListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bestSeller = bestSellers[indexPath.row]
        
        let bestSellerDetailsVC = BestSellerDetailsVC(bestSeller: bestSeller)
        bestSellerDetailsVC.modalPresentationStyle = .fullScreen
        self.present(bestSellerDetailsVC, animated: true, completion: nil)
    }
}

extension BestSellerListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth: CGFloat = 140.0
        
        let numberOfCells = floor(collectionView.frame.size.width / cellWidth)
        let edgeInsets = (collectionView.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
        
        return UIEdgeInsets(top: 15, left: edgeInsets, bottom: 0, right: edgeInsets)
    }
}
