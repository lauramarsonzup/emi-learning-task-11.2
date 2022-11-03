//
//  DecodingFormattedDates+JSONDecoder.swift
//  LearningTask-11.2
//
//  Created by rafael.rollo on 03/11/2022.
//

import Foundation

extension JSONDecoder {
    convenience init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) {
        self.init()
        self.dateDecodingStrategy = dateDecodingStrategy
    }
    
    static func decodingFormattedDates(with pattern: DateFormatter.CustomPattern) -> JSONDecoder {
        return .init(dateDecodingStrategy: .formatted(pattern.formatter))
    }
}
