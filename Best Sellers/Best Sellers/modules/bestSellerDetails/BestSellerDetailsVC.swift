//
//  BestSellerDetailsVC.swift
//  Best Sellers
//
//  Created by Eduardo Herzer on 23/11/20.
//

import UIKit

class BestSellerDetailsVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbSynopse: UILabel!
    @IBOutlet weak var imgBackArrow: UIImageView!

    private var bestSeller: BestSeller
    
    init(bestSeller: BestSeller) {
        self.bestSeller = bestSeller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.kf.setImage(with: URL(string: bestSeller.book_image))
        lbTitle.text = bestSeller.title
        lbAuthor.text = bestSeller.author
        lbSynopse.text = bestSeller.description
        
        imgBackArrow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.backClicked)))
    }

    @objc func backClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}
