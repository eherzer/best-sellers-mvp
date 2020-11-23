//
//  BestSellerPresenter.swift
//  Best Sellers MVP
//
//  Created by Eduardo Herzer on 20/11/20.
//

import Foundation

class BestSellerPresenter: BestSellerPresenterProtocol {
    weak private var view: BestSellerViewProtocol?
    private var service: BestSellerServiceProtocol
    
    init(view: BestSellerViewProtocol, service: BestSellerServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func loadBestSellers() {
        service.getBestSellers { (bestSellers) in
            self.view?.listLoaded(bestSellers: bestSellers)
        } failure: { (message) in
            self.view?.showError(message: message)
        }
    }
}
