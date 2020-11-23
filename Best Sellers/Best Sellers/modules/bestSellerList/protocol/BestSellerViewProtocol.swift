//
//  BestSellerViewProtocol.swift
//  Best Sellers MVP
//
//  Created by Eduardo Herzer on 20/11/20.
//

import Foundation

protocol BestSellerViewProtocol: NSObjectProtocol {
    func listLoaded(bestSellers: [BestSeller])
    func showError(message: String)
}
