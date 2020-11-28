//
//  CardView.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/22/20.
//

import SwiftUI

let blueArray =  [Color.white, Color.blue]
let redArray =  [Color.white, Color.red]
let greenArray =  [Color.white, Color.green]
let yellowArray =  [Color.white, Color.yellow]
let grayArray = [Color.white, Color.gray]

struct CardView: View {
    var colorArray = [blueArray, redArray, greenArray, yellowArray]
    var cardViewModel: CardViewModel
    var body: some View {
        
        ZStack {
        RoundedRectangle(cornerRadius: 10, style: .circular)
            .fill(LinearGradient(gradient: Gradient(colors: grayArray), startPoint: .topLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .opacity(0.95)
            .blur(radius:0.3)
            .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .shadow(color: .gray, radius: 2.5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            VStack {
            
                Text(cardViewModel.cardTtitle ?? "")
                .offset(x: 0, y: -35)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(cardViewModel.cardDescription ?? "")
                    .offset(x: 0, y: -10)
                    .font(.body)
                    .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardViewModel:MockData.sampleCardView)
    }
}
