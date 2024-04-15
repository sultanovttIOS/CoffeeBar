//
//  CustomTabBar.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 5/4/24.
//

import UIKit
import SnapKit

final class CustomTabBar: UITabBar {
    private let qrButton = QrButton()
    
    override func draw(_ rect: CGRect) {
        configureShape()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()
        setupQrButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        tintColor = .black
        unselectedItemTintColor = .black
    }
    
    private func setupQrButton() {
        addSubview(qrButton)
        NSLayoutConstraint.activate([
            qrButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            qrButton.centerYAnchor.constraint(equalTo: topAnchor),
            qrButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            qrButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
    }
    //MARK: Hit test
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        qrButton.frame.contains(point) ? qrButton : super.hitTest(point, with: event)
    }
}
//MARK: Draw Shape
extension CustomTabBar {
    private func configureShape() {
        let path = getBezierPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.systemGray6.cgColor
        layer.insertSublayer(shape, at: 0)
    }
    
    private func getBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 0))
        
        path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0),
                    radius: 30,
                    startAngle: .pi,
                    endAngle: .pi * 2,
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        return path
    }
}
