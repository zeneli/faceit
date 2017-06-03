//
//  ViewController.swift
//  FaceIt
//
//  Created by Amarildo Zeneli on 3/24/17.
//  Copyright © 2017 Amarildo Zeneli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet {  // outlets take some time to initialize
            // add a pinch gesture handler 
            let handler = #selector(faceView.changeScale(byReactingTo:))
            let pinchRecognizer = UIPinchGestureRecognizer(target: faceView, action: handler)
            faceView.addGestureRecognizer(pinchRecognizer)
            
            // add a tap gesture handler
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleEyes(byRectingTo:)))
            tapRecognizer.numberOfTapsRequired = 1  // default taps
            faceView.addGestureRecognizer(tapRecognizer)  // turn it on: add the recognizer to faceView
            
            updateUI()  // listen and update when initialized
        }
    }
    
    func toggleEyes(byRectingTo tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {  // toggle eyes to new state
            let eyes: FacialExpression.Eyes = (expression.eyes == .closed) ? .open : .closed
            expression = FacialExpression(eyes: eyes, mouth: expression.mouth)
        }
    }
    
    // property observer- anytime we change the model FacialExpression we update the UI
    var expression = FacialExpression(eyes: .closed, mouth: .frown) {
        didSet {
            updateUI()
        }
    }
    
    // make the model match the UI
    private func updateUI() {
        // all faceView are optional to protect against outlets not being set
        switch expression.eyes {
        case .open:
            faceView?.eyesOpen = true
        case .closed:
            faceView?.eyesOpen = false
        case .squiting:
            faceView?.eyesOpen = false
        }
        faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.grin: 0.5, .frown: -1.0, .smile: 1.0, .neutral: 0.0, .smirk: -0.5]
}

