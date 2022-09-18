//
//  ViewController.swift
//  Navigation
//
//  Created by Роман Беспалов on 22.06.2022.
//
import UIKit
import StorageService


class FeedViewController: UIViewController {
    
    private var feedView: FeedView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! FeedView)
    }
    
    override func loadView() {
            super.loadView()
            
            let feedView = FeedView()
            feedView.configure()
            feedView.setupConstraint()
            
            view = feedView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Feed"
        setupActions()
    }
    
    private func setupActions() {
        feedView.checkGuessButton.addTarget(self, action: #selector(check), for: .touchUpInside)
        feedView.button1.addTarget(self, action: #selector(tap), for: .touchUpInside)
        feedView.button2.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    @objc private func tap() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
    }

    @objc private func check() {
        let check = FeedModel()

        if feedView.checkTextField.text != "" {
            if check.check(word: feedView.checkTextField.text!) {
                let ac = UIAlertController(title: "Верно!", message: "Ты все сделал правильно!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "OK", style: .default)
                ac.addAction(OKButton)
                present(ac, animated: true)
                feedView.checkLabel.backgroundColor = .green
            } else {
                let ac = UIAlertController(title: "Мимо!", message: "Не угадал!", preferredStyle: .alert)
                let OKButton = UIAlertAction(title: "Еще попытка", style: .default)
                ac.addAction(OKButton)
                present(ac, animated: true)
                feedView.checkLabel.backgroundColor = .red
            }
        } else {
            let ac = UIAlertController(title: "Пусто", message: "Пустое поле ввода", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "ОК", style: .default)
            ac.addAction(OKButton)
            present(ac, animated: true)
        }
    }
}

