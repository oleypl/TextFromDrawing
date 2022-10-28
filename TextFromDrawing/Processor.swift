//
//  Processor.swift
//  TextFromDrawing
//
//  Created by Michal on 28/10/2022.
//

//import Foundation
//import Firebase
//
//class Processor {
//    let vision = Vision
//    var textRecognizer: VisionTextRecognizer!
//    
//    init() {
//        textRecognizer = vision.onDeviceTextRecognizer()
//    }
//    
//    func process(in imageView: UIImageView, callback: @escaping (_ text: String) -> Void) {
//        //1
//        guard let image = imageView.image else { return }
//        //2
//        let visionImage = VisionImage(image: image)
//        //3
//        textRecognizer.process(visionImage) { (result, error) in
//            //4
//            guard
//                error == nil,
//                let result = result,
//                !result.text.isEmpty
//            else {
//                callback("")
//                return
//            }
//            //5
//            callback(result.text)
//        }
//    }
//}
