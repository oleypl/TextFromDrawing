//
//  ContentView.swift
//  TextFromDrawing
//
//  Created by Michal on 28/10/2022.
//

import SwiftUI
import PencilKit
import Vision

struct ContentView: View {
    @State private var canvasView = PKCanvasView()
    
    
    let imgRect = CGRect(x: 0, y: 0, width: 350, height: 350)

    
    var body: some View {
        VStack{
            CanvasView(canvasView: $canvasView)
                .padding(.top)
                .frame(width: 350,height: 350)
                .border(Color.black)
            
            Button {
                saveToPhotosAlbum()
            } label: {
                Text("SAVE PHOTO")
            }
            
            
        }
    }
    
    func saveToPhotosAlbum() {
        let image = canvasView.drawing.image(from: imgRect, scale: 1.0)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
