//
//  ContentView.swift
//  A12_War_SAL
//
//  Created by Sean Logsdon on 11/11/20.
//

import SwiftUI
import AVFoundation
var player: AVAudioPlayer!
var player2: AVAudioPlayer!


struct ContentView: View {
    
    @State private var randNum1 = 14
    @State private var randNum2 = 14
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    @State private var card1 = "back"
    @State private var card2 = "back"
    @State private var status = "Press Deal!"
    
    var body: some View {
        

        ZStack {
                Image("Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            
            VStack {
            
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack{
                    Image(card1)
                    Image(card2)                }
                
                Spacer()
                
                Button(action: {
                    
                    // Randoms cards
                    self.randNum1 =
                        Int.random(in: 2...14)
                    self.randNum2 =
                        Int.random(in: 2...14)
                    
                    // Sets cards to back on app start
                    card1 = "card" + String(randNum1)
                    card2 = "card" + String(randNum2)
                    
                    
                    // Updates scores
                    if self.randNum1 > self.randNum2 {
                        score1 += 1
                        playSound()
                        status = "Player 1 wins!"
                    }
                    else if self.randNum2 >
                                self.randNum1 {
                        self.score2 += 1
                        playSound2()
                        status = "CPU wins!"
                    }
                        else if self.randNum2 == self.randNum1{
                        self.score1 += 0
                        status = "Tie!"
                        } // I used else if because else was being weird
                        
                
                }) {
                    Image("dealbutton").renderingMode(.original)
                }
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .bold()
                            .padding(.bottom, 20)
                            .font(.custom("Georgia",size: 20))
                        Text(String(score1))
                    }.padding(.leading,20)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                    Text("CPU")
                        .bold()
                        .padding(.bottom, 20)
                        .font(.custom("Georgia",size: 20))
                    Text(String(score2))
                    }.padding(.trailing,20)
                    .foregroundColor(.white)
                }
                    Spacer()
                
                Text(status)
                    .bold()
                    .padding(.bottom, 20)
                    .font(.custom("Georgia",size: 40))
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "fanfare", withExtension: "wav")
        
        // returns if url is empty
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        }catch {
            print("Sound1 Error")
    }
        
    }
    
    func playSound2() {
        let url2 = Bundle.main.url(forResource: "failure", withExtension: "mp3")
        
        // returns if url is empty
        guard url2 != nil else {
            return
        }
        
        do {
            player2 = try AVAudioPlayer(contentsOf: url2!)
            player2?.play()
        }catch {
            print("Sound1 Error")
    }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
