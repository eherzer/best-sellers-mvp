//
//  BestSellerServiceErrorMock.swift
//  Best SellersTests
//
//  Created by Eduardo Herzer on 24/11/20.
//

import Foundation
@testable import Best_Sellers

class BestSellerServiceErrorMock: BestSellerServiceProtocol {
    func getBestSellers(success: @escaping ([BestSeller]) -> Void, failure: @escaping (String) -> Void) {
        failure("mock error")
    }
}
