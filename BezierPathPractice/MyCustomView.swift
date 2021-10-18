//
//  MyCustomView.swift
//  BezierPathPractice
//
//  Created by 김태훈 on 2021/10/18.
//

import UIKit

class MyCustomView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let path = UIBezierPath()
        path.lineWidth = 7
        path.lineCapStyle = .round
        path.usesEvenOddFillRule = true

        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 200))

        path.addLine(to: CGPoint(x: 200, y: 250))

        UIColor.yellow.set()

        path.fill()

        path.close()
        
        UIColor.black.set()
        path.stroke()

    }
}
