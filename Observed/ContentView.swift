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
        VStack(spacing: 10) {
            Text("\(stuff.text)")
                .font(.largeTitle)
                .padding()
            Button(stuff.buttonText) {
                stuff.changeText()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
