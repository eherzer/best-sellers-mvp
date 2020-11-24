//
//  String+Capitalization.swift
//  Best Sellers
//
//  Created by Eduardo Herzer on 24/11/20.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
