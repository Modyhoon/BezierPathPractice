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

        let view = MyCustomView(frame: self.view.frame)
        view.backgroundColor = .clear
        self.view.addSubview(view)
    }


}

