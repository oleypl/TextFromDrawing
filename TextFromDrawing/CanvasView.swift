//
//  CanvasView.swift
//  TextFromDrawing
//
//  Created by Michal on 28/10/2022.
//

import SwiftUI
import PencilKit


struct CanvasView {
    @Binding var canvasView: PKCanvasView
}

extension CanvasView: UIViewRepresentable {
  func makeUIView(context: Context) -> PKCanvasView {
      canvasView.tool = PKInkingTool(.pen, color: .gray, width: 10)
      canvasView.allowsFingerDrawing = true

#if targetEnvironment(simulator)
      
    #endif
    return canvasView
  }

  func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}
