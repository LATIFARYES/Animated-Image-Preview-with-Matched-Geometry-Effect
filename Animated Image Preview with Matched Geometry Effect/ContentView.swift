//
//  ContentView.swift
//  Animated Image Preview with Matched Geometry Effect
//
//  Created by LATIFA on 28/01/2024.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var previewSmoothly
    @State private var preview = false
    @State private var selectedImage: String?
    var body: some View {
        ZStack{
            if preview {
                
                if let selectedImage = selectedImage {
                    
                    image(selectedImage)
                        .ignoresSafeArea()
                }
            } else {
                Grid {
                    GridRow{
                        image("image1")
                        image("image2")
                    }
                    GridRow {
                        image("image3")
                        image("image4")
                    }
                }
                .padding(10)
            }
        }
    }
    
    func image(_ imageName: String) -> some View {
    Image(imageName)
    .resizable()
    .matchedGeometryEffect(id: imageName, in: previewSmoothly)
    .zIndex(selectedImage == imageName ? 1 : 0)
    .onTapGesture {
        withAnimation(Animation.easeIn(duration: 0.3)) {
            selectedImage = imageName
            preview.toggle()
            
            
        }
    }
    }
}
    

#Preview {
    ContentView()
}
