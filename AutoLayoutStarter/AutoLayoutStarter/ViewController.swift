//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

// custom hex color
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 233, "Invalid red component")
        assert(green >= 0 && green <= 62, "Invalid green component")
        assert(blue >= 0 && blue <= 55, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xE9,
            green: (rgb >> 8) & 0x3E,
            blue: rgb & 0x37
        )
    }
}

let ligthOrange = UIColor(rgb: 0xE93E37)

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    
    // Assignment code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
        
        // purple box
        let purpleBox = UIView()
        purpleBox.backgroundColor = .purple
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(purpleBox)
        NSLayoutConstraint.activate([
            // 1. bottom margin
            purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            // 2. right margin
            purpleBox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20),
            // 3. height
            purpleBox.heightAnchor.constraint(equalToConstant: 50),
            // 4. width relative to the greenView's widt
            purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7)
            ])
        
        // stack view for blue squares
        let stackViewBlueSquare = UIView()
        //stackViewBlueSquare.backgroundColor = .yellow
        stackViewBlueSquare.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(stackViewBlueSquare)
        NSLayoutConstraint.activate([
            // top margin
            stackViewBlueSquare.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 80),
            // bottom margin
            stackViewBlueSquare.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -40),
            // center x anchor
            stackViewBlueSquare.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            // center y anchor
            stackViewBlueSquare.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            // variable height
            stackViewBlueSquare.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7),
            // fixed width
            stackViewBlueSquare.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        // top square box
        let topBlueSquare = UIView()
        topBlueSquare.backgroundColor = .blue
        topBlueSquare.translatesAutoresizingMaskIntoConstraints = false
        stackViewBlueSquare.addSubview(topBlueSquare)
        NSLayoutConstraint.activate([
            // top margin
            topBlueSquare.topAnchor.constraint(equalTo: stackViewBlueSquare.topAnchor, constant: 0),
            // left margin
            topBlueSquare.leftAnchor.constraint(equalTo: stackViewBlueSquare.leftAnchor, constant: 0),
            // fixed height
            topBlueSquare.heightAnchor.constraint(equalToConstant: 50),
            // variable width depending of container stack
            topBlueSquare.widthAnchor.constraint(equalTo: stackViewBlueSquare.widthAnchor, multiplier: 1)
            ])
        
        // bottom square box
        let bottomBlueSquare = UIView()
        bottomBlueSquare.backgroundColor = .blue
        bottomBlueSquare.translatesAutoresizingMaskIntoConstraints = false
        stackViewBlueSquare.addSubview(bottomBlueSquare)
        NSLayoutConstraint.activate([
            // bottom margin
            bottomBlueSquare.bottomAnchor.constraint(equalTo: stackViewBlueSquare.bottomAnchor, constant: 0),
            // left margin
            bottomBlueSquare.leftAnchor.constraint(equalTo: stackViewBlueSquare.leftAnchor, constant: 0),
            // fixed height
            bottomBlueSquare.heightAnchor.constraint(equalToConstant: 50),
            // variable width depending of container stack
            bottomBlueSquare.widthAnchor.constraint(equalTo: stackViewBlueSquare.widthAnchor, multiplier: 1)
            ])
        
        // middle square box
        let middleBlueSquare = UIView()
        middleBlueSquare.backgroundColor = .blue
        middleBlueSquare.translatesAutoresizingMaskIntoConstraints = false
        stackViewBlueSquare.addSubview(middleBlueSquare)
        NSLayoutConstraint.activate([
            // left margin
            middleBlueSquare.leftAnchor.constraint(equalTo: stackViewBlueSquare.leftAnchor, constant: 0),
            // center x anchor
            middleBlueSquare.centerXAnchor.constraint(equalTo: stackViewBlueSquare.centerXAnchor),
            // center y anchor
            middleBlueSquare.centerYAnchor.constraint(equalTo: stackViewBlueSquare.centerYAnchor),
            // fixed height
            middleBlueSquare.heightAnchor.constraint(equalToConstant: 50),
            // variable width depending of container stack
            middleBlueSquare.widthAnchor.constraint(equalTo: stackViewBlueSquare.widthAnchor, multiplier: 1)
            ])
        
        // orange top box
        let orangeBox = UIView()
        orangeBox.backgroundColor = ligthOrange
        orangeBox.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(orangeBox)
        NSLayoutConstraint.activate([
            // top margin
            orangeBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            // right margin
            orangeBox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20),
            // fixed height
            orangeBox.heightAnchor.constraint(equalToConstant: 50),
            // fixed width
            orangeBox.widthAnchor.constraint(equalToConstant: 200),
            ])
        
        // orange top inner box 1
        let orangeBoxInnerLeft = UIView()
        orangeBoxInnerLeft.backgroundColor = .orange
        orangeBoxInnerLeft.translatesAutoresizingMaskIntoConstraints = false
        orangeBox.addSubview(orangeBoxInnerLeft)
        NSLayoutConstraint.activate([
            // top margin
            orangeBoxInnerLeft.topAnchor.constraint(equalTo: orangeBox.topAnchor, constant: 7),
            // left margin
            orangeBoxInnerLeft.leftAnchor.constraint(equalTo: orangeBox.leftAnchor, constant: 8),
            // fixed height
            orangeBoxInnerLeft.heightAnchor.constraint(equalToConstant: 35),
            // fixed width
            orangeBoxInnerLeft.widthAnchor.constraint(equalToConstant: 110),
            ])
        
        // orange top inner box 2
        let orangeBoxInnerRight = UIView()
        orangeBoxInnerRight.backgroundColor = .orange
        orangeBoxInnerRight.translatesAutoresizingMaskIntoConstraints = false
        orangeBox.addSubview(orangeBoxInnerRight)
        NSLayoutConstraint.activate([
            // top margin
            orangeBoxInnerRight.topAnchor.constraint(equalTo: orangeBox.topAnchor, constant: 7),
            // right margin
            orangeBoxInnerRight.rightAnchor.constraint(equalTo: orangeBox.rightAnchor, constant: -8),
            // fixed height
            orangeBoxInnerRight.heightAnchor.constraint(equalToConstant: 35),
            // fixed width
            orangeBoxInnerRight.widthAnchor.constraint(equalToConstant: 65),
            ])
        
        
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

