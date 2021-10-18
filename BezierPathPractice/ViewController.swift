//
//  ViewController.swift
//  BezierPathPractice
//
//  Created by 김태훈 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = UIBezierPath()
        path.lineWidth = 2
        path.lineJoinStyle = .round
        path.usesEvenOddFillRule = true

        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 200))

        path.close()
    }


}

