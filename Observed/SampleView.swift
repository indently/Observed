//
//  SampleView.swift
//  Observed
//
//  Created by Federico on 13/11/2021.
//

import SwiftUI

struct SampleView: View {
    @ObservedObject var stuff: Stuff
    
    var body: some View {
        Text("\(stuff.counter)")
            .font(.system(size:40, weight: .bold))
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(stuff: Stuff())
    }
}
