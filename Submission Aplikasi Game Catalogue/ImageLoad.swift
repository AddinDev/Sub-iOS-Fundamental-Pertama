//
//  Image.swift
//  Submission Aplikasi Game Catalogue
//
//  Created by pasto on 01/07/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct ImageLoad: View {
    
    @ObservedObject var networking = Networking()
     
    var placeholder: Image
     
     init(url: String, placeholder: Image = Image(systemName: "photo")) {
         self.placeholder = placeholder
         networking.fetchImage(url: url)
     }
    
    var body: some View {
        if let image = self.networking.downloadImage {
            return Image(uiImage: image).resizable()
        }
        return placeholder
    }
}

//ngambil poto game
@Published var downloadImage: UIImage?

func fetchImage(url: String) {
    guard let imageURL = URL(string: url) else {
        fatalError("The url is not valid")
    }
    
    URLSession.shared.dataTask(with: imageURL) { data, response, error in
        guard let data = data, error == nil else {
            fatalError("error reading image")
        }
        
        DispatchQueue.main.async {
            self.downloadImage = UIImage(data: data)
            
        }
    }.resume()
}
struct Image_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoad(url: "")
    }
}
