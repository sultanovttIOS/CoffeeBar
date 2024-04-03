//
//  ViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {

    private let startView = StartView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = startView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

