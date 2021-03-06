//
//  AddCardView.swift
//  SwiftUIExperiment
//
//  Created by Alphonso Sensley II on 11/24/20.
//

import SwiftUI

struct AddNewCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var description: String = ""
    var body: some View {
       
        ZStack {
            Color.clear
                .blur(radius: 3.0)
                .edgesIgnoringSafeArea(.all)
        VStack {
        Text("Add A New Card")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .offset(x: 0, y: 30)
           Spacer()
            VStack {
            TextField("Card Title:", text: $title)
                .foregroundColor(.blue)
                .frame(width: 300, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .border(Color.gray)
                
            TextField("Card Description:", text: $description)
                .frame(width: 300, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .border(Color.gray)
            }
            .offset(x: 0, y: -500)
            Button() {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }
            .frame(width: 80, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            .offset(x: 0, y: -400)
           
            
           
            }
        .onDisappear(perform: {
            addCardMethod()
        })
           
        }
    }
    
    func addCardMethod() {
        let newCard = CardViewModel(cardTtitle: self.title, cardDescription: self.description)
        print(newCard)
        cardViewCollection.append(newCard)
        print(cardViewCollection)
    }
    }
struct AddNewCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCardView()
    }
}
