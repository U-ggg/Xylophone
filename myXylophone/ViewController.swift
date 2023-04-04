//
//  ViewController.swift
//  myXylophone
//
//  Created by Sidzhe on 3/4/23.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    let buttonC = UIButton()
    let buttonD = UIButton()
    let buttonE = UIButton()
    let buttonF = UIButton()
    let buttonG = UIButton()
    let buttonA = UIButton()
    let buttonB = UIButton()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        setupViews()
        
    }
    
    private func createButton(button: UIButton, title: String, color: UIColor, constraint: Int) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 3
        stackView.addArrangedSubview(button)
        button.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview().inset(constraint)
        }
    }
    
    private func setupViews() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        buttonC.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        buttonD.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        buttonE.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        buttonF.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        buttonG.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        buttonA.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        buttonB.addTarget(self, action: #selector(playSound(_:)), for: .touchUpInside)
        
        createButton(button: buttonC, title: "C", color: .systemRed, constraint: 5)
        createButton(button: buttonD, title: "D", color: .orange, constraint: 10)
        createButton(button: buttonE, title: "E", color: .systemYellow, constraint: 15)
        createButton(button: buttonF, title: "F", color: .systemGreen, constraint: 20)
        createButton(button: buttonG, title: "G", color: .purple, constraint: 25)
        createButton(button: buttonA, title: "A", color: .systemBlue, constraint: 30)
        createButton(button: buttonB, title: "B", color: .systemPurple, constraint: 35)
        
    }
    
    @objc private func playSound(_ sender: UIButton) {
        let url = Bundle.main.url(forResource: sender.titleLabel?.text!, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            sender.alpha = 1
        }
    }
}
