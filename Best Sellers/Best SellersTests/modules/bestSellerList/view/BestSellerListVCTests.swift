//
//  BestSellerListVCTests.swift
//  Best SellersTests
//
//  Created by Eduardo Herzer on 24/11/20.
//

import XCTest
@testable import Best_Sellers

class BestSellerListVCTests: XCTestCase {
    
    func testListSuccess() {
        let expectation = self.expectation(description: "List loaded")
        
        let mockVC = BestSellerListVCMockSuccess()
        mockVC.expectation = expectation
        mockVC.presenter =  BestSellerPresenter(view: mockVC, service:  BestSellerServiceMock())
        mockVC.presenter?.loadBestSellers()
        
        wait(for: [expectation], timeout: 2)
    }

    
    func testListError() {
        let expectation = self.expectation(description: "List not loaded")
        
        let mockVC = BestSellerListVCMockError()
        mockVC.expectation = expectation
        mockVC.presenter =  BestSellerPresenter(view: mockVC, service:  BestSellerServiceErrorMock())
        mockVC.presenter?.loadBestSellers()
        
        wait(for: [expectation], timeout: 2)
    }
}
