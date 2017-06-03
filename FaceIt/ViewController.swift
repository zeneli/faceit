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
            
            updateUI()  // listen and update when initialized
        }
    }
    
    var expression = FacialExpression(eyes: .closed, mouth: .frown) {
        didSet {  // property observer- anytime we change the expression, update the UI
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

