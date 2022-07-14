//
//  Date+Extension.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 04/07/22.
//

import Foundation

extension Date {
    var onlyDate: Date? {
        get {
            let calendar = Calendar.current
            var dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
            dateComponents.timeZone = NSTimeZone.system
            return calendar.date(from: dateComponents)
        }
    }

}
