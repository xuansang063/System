//
//  BaseViewController.swift
//  System
//
//  Created by SangNX on 11/10/19.
//  Copyright © 2019 nxsang063@gmail.com. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var backButton: UIButton! = UIButton(frame: CGRect(x: 10, y: ScreenSize.Height >= 812 ? CGFloat(30) : CGFloat(20), width: 50, height: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        let image = UIImage(named: "BackButton")
        self.backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        self.backButton.setImage(image, for: UIControl.State.normal)
        self.backButton.addTarget(self, action: #selector(backButtonTouch), for: UIControl.Event.touchUpInside)

        // Add navigation back button
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            self.view.addSubview(self.backButton)
        }

        if self.navigationController!.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.navigationController?.interactivePopGestureRecognizer!.isEnabled = true
            self.navigationController?.interactivePopGestureRecognizer!.delegate = nil
        }
    }

    @objc func backButtonTouch () -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}


