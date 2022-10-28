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
    @State var recoString = [""]
    @State var ttt = ""
    
    let imgRect = CGRect(x: 0, y: 0, width: 350, height: 350)
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.05)
            
            VStack{
                CanvasView(canvasView: $canvasView)
                    .frame(width: 350,height: 350)
                    .border(Color.black)
                
                Button {
                    canvasView.drawing = PKDrawing()
                } label: {
                    Text("CLEAR")
                }
                .padding()
                
                Button {
                    textRecognition()
                    convertResults()
                } label: {
                    Text("TEXT RECOGNITION")
                }
                .padding()
                
                Button {
                    saveToPhotosAlbum()
                } label: {
                    Text("SAVE PHOTO")
                }
                .padding()
                
                Text("Recognized letters: \(ttt)")
                    .padding()
                
            }
        }.ignoresSafeArea(.all)
    }
    
    func convertResults() {
        for letter in recoString {
            ttt.append(letter)
        }
    }
    
    func saveToPhotosAlbum() {
        let image = canvasView.drawing.image(from: imgRect, scale: 1.0)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }

    func textRecognition() {
        // Get the CGImage on which to perform requests.
//        guard let cgImage = UIImage(named: "snapshot")?.cgImage else { return }
        guard let cgImage = canvasView.drawing.image(from: imgRect, scale: 1.0).cgImage else { return }

        
        // Create a new image-request handler.
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)

        // Create a new request to recognize text.
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)

        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
            return
        }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            return observation.topCandidates(1).first?.string
        }
        ttt = ""
        recoString = recognizedStrings
        
        print(recognizedStrings)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
