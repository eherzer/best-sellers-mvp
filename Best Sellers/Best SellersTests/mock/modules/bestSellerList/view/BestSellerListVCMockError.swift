//
//  BestSellerListVCMockError.swift
//  Best SellersTests
//
//  Created by Eduardo Herzer on 24/11/20.
//

import Foundation
@testable import Best_Sellers
import XCTest

class BestSellerListVCMockError: NSObject, BestSellerViewProtocol {
    var presenter: BestSellerPresenterProtocol?
    var expectation: XCTestExpectation?
    
    func listLoaded(bestSellers: [BestSeller]) {
        XCTFail()
    }
    
    func showError(message: String) {
        expectation?.fulfill()
    }
}
