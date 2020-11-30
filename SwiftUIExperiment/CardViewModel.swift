//
//  CardViewModel.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/23/20.
//

import Foundation
import SwiftUI

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
        
        
    }
    func timeOfDay() -> Int {
        var timeOfDay = Int()
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        timeOfDay = hour
        return timeOfDay
    }
}

func daysArrayLogic() -> [String] {
    var tempArray = [String]()
    let today = Date().dayOfWeek()
    if today == "Sunday" {
        tempArray.removeAll()
        tempArray = ["Today","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    }
    if today == "Monday" {
        tempArray.removeAll()
        tempArray = ["Today","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday","Monday"]
    }
    if today == "Tuesday" {
        tempArray.removeAll()
        tempArray = ["Today","Wednesday","Thursday","Friday","Saturday","Sunday","Monday","Tuesday"]
    }
    if today == "Wednesday" {
        tempArray.removeAll()
        tempArray = ["Today","Thursday","Friday","Saturday","Sunday","Monday","Tuesday","Wednesday"]
    }
    if today == "Thursday" {
        tempArray.removeAll()
        tempArray = ["Today)","Friday","Saturday","Sunday","Monday","Tuesday","Wednesday", "Thursday"]
    }
    if today == "Friday" {
        tempArray.removeAll()
        tempArray = ["Today","Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"]
    }
    if today == "Saturday" {
        tempArray.removeAll()
        tempArray = ["Today","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    }
    
    return tempArray
}


struct CardViewModel: Hashable, Identifiable {
    let id = UUID()
    let cardTtitle: String?
    let cardDescription: String?
    let offSet:CGFloat = 5
    
}


struct MockData {
    static let sampleCardView = CardViewModel(cardTtitle: "Monday", cardDescription: "Today will be Motivational Monday")
    
    @State static var cardViewCollection = [
                                     CardViewModel(cardTtitle: "Saturday", cardDescription: "Today will be Success Saturday"),
                                     CardViewModel(cardTtitle: "Friday", cardDescription: "Today will be Finance Friday"),
                                     CardViewModel(cardTtitle: "Thursday", cardDescription: "Today will be Tech Talk Thursday"),
                                     CardViewModel(cardTtitle: "Wednesday", cardDescription: "Today will be Wisdom Wednesday"),
                                     CardViewModel(cardTtitle: "Tuesday", cardDescription: "Today will be Teaching Tuesday"),
                                     CardViewModel(cardTtitle: "Monday", cardDescription: "Today will be Motivational Monday"),
                                     CardViewModel(cardTtitle: "Sunday", cardDescription: "Decide to start the day happy. Let nothing steal your joy! How you start your day sets the tone for the rest of your day")
    ]
}
