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
    
    private var skullRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath {
        
    }
    
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0
        return path
    }
    
    // Inside draw's coordinate system
    override func draw(_ rect: CGRect) {
        // Emoji face
        UIColor.blue.set()
        pathForSkull().stroke()
    }
    
    // Some constants of skull radius to eye and mouth
    private struct Ratios {
        static let skullRadiusToEyeOffset: CGFloat = 3
        static let skullRadiusToEyeRadius: CGFloat = 10
        static let skullRadiusToMouthWidth: CGFloat = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
    }
}
