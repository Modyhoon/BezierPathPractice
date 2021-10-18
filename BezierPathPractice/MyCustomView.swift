//
//  MyCustomView.swift
//  BezierPathPractice
//
//  Created by 김태훈 on 2021/10/18.
//

import UIKit

class MyCustomView: UIView {

    var pathLayer: CAShapeLayer = CAShapeLayer()
    var button: UIButton = UIButton()
    let imageView = UIImageView(image: UIImage(named: "star"))
    var path = UIBezierPath()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }

    func configure() {
        self.addSubview(self.button)
        self.button.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        self.button.addTarget(self, action: #selector(self.onButtonTapped(_:)), for: .touchUpInside)
        self.button.backgroundColor = .orange

        let starbucksCup = UIImageView(image: UIImage(named: "starbucksCup"))
        starbucksCup.frame = CGRect(x: 150, y: 250, width: 100, height: 100)
        self.addSubview(starbucksCup)

        path.move(to: CGPoint(x: 50, y: 0))
        path.addCurve(to: CGPoint(x: 200, y: 300), controlPoint1: CGPoint(x: 20, y: 150), controlPoint2: CGPoint(x: 20, y: 200))

        //Create a CAShape Layer
        pathLayer.frame = CGRect(x: 50, y: 0, width: 50, height: 50)
        pathLayer.path = path.cgPath
        pathLayer.fillColor = nil
        pathLayer.lineJoin = .bevel
    }

    @objc func onButtonTapped(_ sender: UIButton) {
        self.addSubview(self.imageView)

        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.repeatCount = 1
        animation.duration = 1.0

        animation.path = path.cgPath
        animation.delegate = self

//        imageView.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50) // 이 차이는 뭘까?? 위치가 초기화 되고 안되고 차이...
        imageView.layer.add(animation, forKey: "move image")
    }
}

extension MyCustomView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.pathLayer.removeFromSuperlayer()
        print("animation end")
    }
}
