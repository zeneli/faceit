//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Amarildo Zeneli on 6/14/17.
//  Copyright © 2017 Amarildo Zeneli. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        // ensure segue destination is a FaceViewController
        if let FaceViewController = destinationViewController as? FaceViewController {
            if let identifier = segue.identifier {  // ensure the segue identifier is set
                // need the facial expression to set and do actual preparing
                if let expression = emotionalFaces[identifier] {
                    FaceViewController.expression = expression
                }
            }
        }
    }
    
    // Dictionary of segue identifier and facial expressions
    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "sad": FacialExpression(eyes: .closed, mouth: .frown),
        "happy": FacialExpression(eyes: .open, mouth: .smile),
        "worried": FacialExpression(eyes: .open, mouth: .smirk)
    ]

}
