//
//  BestSellerService.swift
//  Best Sellers
//
//  Created by Eduardo Herzer on 23/11/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class BestSellerService: BestSellerServiceProtocol {
    private let apiKey = ""
    
    func getBestSellers(success: @escaping ([BestSeller]) -> Void, failure: @escaping (String) -> Void) {
        let request = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-nonfiction.json"
        let parameters = ["api-key": apiKey]
        
        if apiKey.isEmpty {
            failure("Please inform an API Key at BestSellerService class")
            return
        }
        
        AF.request(request, method: .get, parameters: parameters).responseJSON { (response) in
            if let responseError = response.error {
                failure(responseError.localizedDescription)
                return
            }
            
            do {
                if let responseData = response.data {
                    let jsonResponse = try JSON(data: responseData)
                    let jsonArray = jsonResponse["results"]["books"]
                    
                    if let bestSellers = try? JSONDecoder().decode([BestSeller].self, from: jsonArray.rawData()) {
                        success(bestSellers)
                        return
                    }
                }
                
                failure("Could not load best seller list")
            } catch {
                failure(error.localizedDescription)
            }
        }
    }
}
