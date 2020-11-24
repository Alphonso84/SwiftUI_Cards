//
//  ContentView.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/22/20.
//

import SwiftUI


struct ContentView: View {
    @State private var addButtonWasPressed = false
    @State private var sliderValue:CGFloat = 0.0
   
    var cardOffset:CGFloat = 5
    var rotationDirection:CGFloat = 360
    var body: some View {
        VStack {
            Spacer()
            Button() {
               
            } label: {
                Image(systemName:"plus.rectangle.on.rectangle")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .offset(x: 160, y: -230)
            
            Slider(value: $sliderValue)
                .frame(width: 300)
                .foregroundColor(.blue)
                .offset(y: -180)
            ZStack {
                ForEach(MockData.cardViewCollection.indices) { card  in
                    CardView(cardViewModel:MockData.cardViewCollection[card])
                        .offset(x:CGFloat(card) * 2, y:CGFloat(card) * CGFloat(sliderValue * 30))
                }
            }
            .offset(x:-20, y: -150)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
