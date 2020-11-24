//
//  CardView.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/22/20.
//

import SwiftUI


struct CardView: View {
    var cardViewModel: CardViewModel
    var body: some View {
        
        ZStack {
        RoundedRectangle(cornerRadius: 10, style: .circular)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .topLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            VStack {
            
                Text(cardViewModel.cardTtitle ?? "")
                .offset(x: 0, y: -55)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(cardViewModel.cardDescription ?? "")
                    .offset(x: 0, y: -40)
                    .font(.body)
                    .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardViewModel:MockData.sampleCardView)
    }
}
