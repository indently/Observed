//
//  ContentView.swift
//  Observed
//
//  Created by Federico on 11/11/2021.
//

import SwiftUI

//@StateObject is used when you create data for the first time
//@ObservedObject is used when you are just observing

class Stuff: ObservableObject {
    @Published var text = "Not updated"
    @Published var buttonText = "Update"
    @Published var counter = 0
    
    func changeText()  {
        Task {
            print(self, "- Task started!")
            sleep(3)
            
            DispatchQueue.main.async {
                self.text = "Text changed!"
                self.buttonText = "Reset"
            }
        }
    }
}

struct ContentView: View {
    @StateObject var stuff = Stuff()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(stuff.text)")
                .font(.largeTitle)
     
            Button(stuff.buttonText) {
                stuff.changeText()
            }
            
            Button("Tapped: \(stuff.counter)") {
                stuff.counter += 1
            }
            .foregroundColor(.orange)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
