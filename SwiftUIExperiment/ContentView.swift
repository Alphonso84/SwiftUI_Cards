//
//  ContentView.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/22/20.
//

import SwiftUI


struct ContentView: View {
    @State private var addButtonWasPressed = false
    @State private var offsetValue = CGSize.zero
    @State var newCardViewCollection: [CardViewModel]
   
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color("MyColor")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        VStack {
            Spacer()
            Button() {
                addButtonWasPressed = true
               
            } label: {
                Image(systemName:"plus.rectangle.on.rectangle")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            
            .offset(x: 160, y: -230)
            
            ZStack {
                ForEach(MockData.cardViewCollection.indices) { card  in
                    CardView(cardViewModel:MockData.cardViewCollection[card])
                        .offset(x:CGFloat(card) * 1, y:CGFloat(card) * CGFloat(offsetValue.height / 10))
                       
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    offsetValue  = gesture.translation
                                }
                                .onEnded { _ in
                                    offsetValue  = offsetValue
//                                    if abs(self.offsetValue.height) > 150 {
//                                        // remove the card
//
//                                    } else {
//                                        //self.offsetValue.height = .zero
//                                    }
                                }
                        )
                }
            }
            .offset(x:-20, y: -150)
            
            
            Spacer()
        }
        .onAppear(perform: {
            print(MockData.cardViewCollection.description)
        })
        
        .sheet(isPresented: $addButtonWasPressed) {
            AddNewCardView()
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(newCardViewCollection: [CardViewModel(cardTtitle:"Test" , cardDescription: "test")])
    }
}
