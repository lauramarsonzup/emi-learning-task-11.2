//
//  CustomPatterns+DateFormatter.swift
//  LearningTask-11.2
//
//  Created by rafael.rollo on 03/11/2022.
//

import Foundation

extension DateFormatter {
    
    private static var yearMonthAndDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }()
    
    private static var dayMonthAndYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        return formatter
    }()
    
    enum CustomPattern {
        case yearMonthAndDay
        case dayMonthAndYear
        
        var formatter: DateFormatter {
            switch self {
            case .yearMonthAndDay:
                return DateFormatter.yearMonthAndDayFormatter
            case .dayMonthAndYear:
                return DateFormatter.dayMonthAndYearFormatter
            }
        }
    }
    
    static func format(date: Date, to customPattern: CustomPattern) -> String {
        return customPattern.formatter.string(from: date).uppercased()
    }
    
}
