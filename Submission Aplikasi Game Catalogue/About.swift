//
//  About.swift
//  Submission Aplikasi Game Catalogue
//
//  Created by pasto on 30/06/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct About: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.97, green: 0.95, blue: 0.92, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("addin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    .shadow(radius: 10)
                Text("Addin Satria Panambang")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.black)
                Text("iOS Developer")
                    .font(.system(size: 20))
                
            }
        }
    .navigationBarTitle("About")
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
