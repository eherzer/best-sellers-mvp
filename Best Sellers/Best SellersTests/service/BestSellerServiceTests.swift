//
//  BestSellerServiceTests.swift
//  Best SellersTests
//
//  Created by Eduardo Herzer on 24/11/20.
//

import XCTest
@testable import Best_Sellers

enum MockServiceType: Int {
    case success
    case failure
}

class BestSellerServiceTests: XCTestCase {
    var service: BestSellerServiceProtocol?
    
    func prepareMockService(type: MockServiceType) {
        switch type {
        case .success:
            service = BestSellerServiceMock()
        default:
            service = BestSellerServiceErrorMock()
        }
    }
    
    func testLoadSuccess() {
        self.prepareMockService(type: .success)
        self.service?.getBestSellers(success: { (bestSellers) in
            XCTAssertNotNil(bestSellers)
        }, failure: { (errorMessage) in
            XCTAssertNil(errorMessage)
        })
    }
    
    func testLoadError() {
        self.prepareMockService(type: .failure)
        self.service?.getBestSellers(success: { (bestSellers) in
            XCTAssertNil(bestSellers)
        }, failure: { (errorMessage) in
            XCTAssertNotNil(errorMessage)
        })
    }
}
