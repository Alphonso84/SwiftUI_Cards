//
//  CardViewModel.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/23/20.
//

import Foundation
import SwiftUI


struct CardViewModel: Hashable, Identifiable {
    let id = UUID()
    let cardTtitle: String?
    let cardDescription: String?
    let offSet:CGFloat = 5
    
}


struct MockData {
    static let sampleCardView = CardViewModel(cardTtitle: "Monday", cardDescription: "Today will be Motivational Monday")
    
    static var cardViewCollection = [CardViewModel(cardTtitle: "Monday", cardDescription: "Today will be Motivational Monday"),
                                     CardViewModel(cardTtitle: "Tuesday", cardDescription: "Today will be Teaching Tuesday"),
                                     CardViewModel(cardTtitle: "Wednesday", cardDescription: "Today will be Wisdom Wednesday"),
                                     CardViewModel(cardTtitle: "Thursday", cardDescription: "Today will be Tech Talk Thursday"),
                                     CardViewModel(cardTtitle: "Friday", cardDescription: "Today will be Finance Friday"),
                                     CardViewModel(cardTtitle: "Saturday", cardDescription: "Today will be Success Saturday"),
                                     CardViewModel(cardTtitle: "Sunday", cardDescription: "Decide to start the day happy. Let nothing steal your joy! How you start your day sets the tone for the rest of your day")
    ]
}
