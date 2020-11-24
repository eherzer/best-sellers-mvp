//
//  BestSellerServiceMock.swift
//  Best SellersTests
//
//  Created by Eduardo Herzer on 24/11/20.
//

import Foundation
@testable import Best_Sellers

class BestSellerServiceMock: BestSellerServiceProtocol {
    func getBestSellers(success: @escaping ([BestSeller]) -> Void, failure: @escaping (String) -> Void) {
        success(mockBestSellers())
    }
    
    private func mockBestSellers() -> [BestSeller] {
        var bestSellers = [BestSeller]()
        bestSellers.append(BestSeller(title: "BOOK 1", author: "AUTHOR 1", book_image: "https://s1.nyt.com/du/books/images/9780593139134.jpg", description: "TEST 1"))
        bestSellers.append(BestSeller(title: "BOOK 2", author: "AUTHOR 2", book_image: "https://s1.nyt.com/du/books/images/9780593139134.jpg", description: "TEST 2"))
        
        return bestSellers
    }
}
