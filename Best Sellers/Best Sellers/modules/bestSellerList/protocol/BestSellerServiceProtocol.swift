//
//  BestSellerServiceProtocol.swift
//  Best Sellers
//
//  Created by Eduardo Herzer on 23/11/20.
//

import Foundation

protocol BestSellerServiceProtocol {
    func getBestSellers(success: @escaping(_ bestSellers: [BestSeller]) -> Void,
                        failure: @escaping(_ message: String) -> Void)
}
