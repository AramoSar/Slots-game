//
//  ContentView.swift
//  Slots Demo
//
//  Created by Aram on 06.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [1, 2 , 0]
    @State private var credits = 1000
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            //Background
            Rectangle()
                .foregroundColor(Color(red: 200/255,
                 green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                //Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots!")
                        .bold()
                        .foregroundStyle(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                //Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //Cards
                HStack {
                    Spacer()

                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[2 ] )
                    Spacer()
                }
                HStack {
                    Spacer()

                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[2 ] )
                    Spacer()
                }
                HStack {
                    Spacer()

                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[2 ] )
                    Spacer()
                }
                
                  
                Spacer()
                //Button
                Button(action: {
                    //Set backgrounds back to white
                    self.backgrounds = self.backgrounds.map {
                        _ in Color.white
                    }
                    
                    //Change the images
                    self.numbers = self.numbers.map({ _ in
                        Int.random(in: 0...self.symbols.count - 1)})
                    
                    //Chek winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        //Won
                        self.credits += self.betAmount * 10
                        
                        //Updates backgrounds to green
                        self.backgrounds = self.backgrounds.map {
                            _ in Color.green
                        }
                    }
                    else {
                        self.credits -= self.betAmount
                    }
                    
                }, label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)  
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(.pink)
                        .cornerRadius(20)
                })
                Spacer()
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
