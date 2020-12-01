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
                ForEach(0..<newCardViewCollection.count, id: \.self) { card  in
                    CardView(cardViewModel:newCardViewCollection[card])
                        .offset(x:CGFloat(card) * CGFloat(offsetValue.width / 8), y:CGFloat(card) * CGFloat(offsetValue.height / 10))
                        .rotation3DEffect(Angle(degrees: Double(offsetValue.width / 10)), axis: (x: 0, y: CGFloat(offsetValue.height / 100), z: 0))
                        
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    offsetValue  = gesture.translation
                                }
                                .onEnded { _ in
                                    
                                    withAnimation(.linear(duration: 0.5)) {
                                        offsetValue  = CGSize.zero
                                    }
                                    
                                }
                        )
                }
            }
            .offset(x:-20, y: -150)
            
            
            Spacer()
        }
        .onAppear(perform: {
            newCardViewCollection = MockData.cardViewCollection
            print(MockData.cardViewCollection)
        })
        .onChange(of: MockData.cardViewCollection, perform: { value in
            newCardViewCollection = MockData.cardViewCollection
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
