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

        let argument: [CGFloat] = [10, 20, 70]


        var startAngle: CGFloat = -4 / .pi
        if argument.reduce(0, { $0 + $1 }) == 100 {
            argument.enumerated().forEach({
                let endAngle: CGFloat = startAngle + CGFloat($0.element / 100 * 2) * .pi
                let path = UIBezierPath()
                path.addArc(withCenter: CGPoint(x: 150, y: 250), radius: 150, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                startAngle = endAngle
                path.addLine(to: CGPoint(x: 150, y: 250))
                path.close()
                switch $0.offset {
                case 0:
                    UIColor.red.set()
                case 1:
                    UIColor.blue.set()
                case 2:
                    UIColor.orange.set()
                default: break
                }
                path.fill()
                path.lineWidth = 10
                UIColor.white.set()
                path.stroke()
            })
        }



//        path.lineWidth = 5
//        UIColor.black.set()
//        path.stroke()

        let centerPath = UIBezierPath()
        centerPath.addArc(withCenter: CGPoint(x: 150, y: 250), radius: 100, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        UIColor.white.set()
        centerPath.fill()
    }
}
