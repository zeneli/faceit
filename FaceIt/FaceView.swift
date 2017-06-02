//
//  FaceView.swift
//  FaceIt
//
//  Created by Amarildo Zeneli on 3/24/17.
//  Copyright © 2017 Amarildo Zeneli. All rights reserved.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.9  // means 90%
    
    // Skull
    // computed property for skull; only get property
    private var skullRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale  // radius * scale
    }
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0
        return path
    }

    
    // Eye
    private enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        // local function used here only
        func centerOfEye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter  // start eye at center
            eyeCenter.y -= eyeOffset  // move up a bit
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset  // add or sub eye offset based on left or right eye
            return eyeCenter
        }
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = centerOfEye(eye)
        
        let path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        path.lineWidth = 5.0
        
        return path
    }
    
    
    // Inside draw's coordinate system
    override func draw(_ rect: CGRect) {
        // Emoji face
        UIColor.blue.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
    }
    
    // Some constants of skull radius to eye and skull raidus to mouth
    private struct Ratios {
        // skull to eye ratios
        static let skullRadiusToEyeOffset: CGFloat = 3
        static let skullRadiusToEyeRadius: CGFloat = 10
        // mouth skull to ratios
        static let skullRadiusToMouthOffset: CGFloat = 3
        static let skullRadiusToMouthWidth: CGFloat = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
    }
}
