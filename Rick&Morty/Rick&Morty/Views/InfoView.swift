//
//  InfoView.swift
//  Rick&Morty
//
//  Created by Manish Panta on 12/11/22.
//

import SwiftUI

struct InfoView: View {
    @State var scale = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Image("AppIconImg")
                .resizable()
                .frame(width: 10, height: 10, alignment: .center)
                .cornerRadius(1)
                .scaleEffect(scale)
                .padding()
                .onAppear{
                    let baseAnimation = Animation.easeInOut(duration: 1)
                    let repeatNum = baseAnimation.repeatCount(1)
                    withAnimation(repeatNum) {
                        scale = 9
                                   }
                }
                .padding()
            Text(Bundle.main.displayName ?? "")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color("Color"))
                .padding()
            Text(Bundle.main.version ?? "")
                .font(.title)
                .fontWeight(.medium)
            Text(Bundle.main.build ?? "")
                .font(.caption)
            Spacer()

            Text(Bundle.main.copyright ?? "")
                .font(.caption2)
                .foregroundColor(Color("Color-1"))
        }
        .padding()

    }
    
    
   
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

