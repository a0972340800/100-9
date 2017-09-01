//
//  ViewController.swift
//  OhMyGosh
//
//  Created by john john on 2017/9/1.
//  Copyright © 2017年 John. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        tf.placeholder = "請問你想為什麼？"
        tf.textAlignment = .center
        return tf
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.boldSystemFont(ofSize: 18)
        tv.isUserInteractionEnabled = false
        tv.textAlignment = .center
        return tv
    }()
    
    let answerBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("拜託幫我算算", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return btn
    }()
    
    let cleanBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("好喔!", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cleanBtn.isHidden = true
        
        view.backgroundColor = .white
        
        view.addSubview(textField)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textField]))
        
        view.addSubview(answerBtn)
        answerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        answerBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        answerBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(textView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textView]))

        view.addSubview(cleanBtn)
        cleanBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cleanBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cleanBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": cleanBtn]))

        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0(30)]-20-[v1]-20-[v2(200)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textField, "v1": answerBtn, "v2": textView]))
        
        
        answerBtn.addTarget(self, action: #selector(answerTheQuestion), for: .touchUpInside)
        cleanBtn.addTarget(self, action: #selector(cleanTheAnswer), for: .touchUpInside)


        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func answerTheQuestion() {
        
            if textField.text != "" {
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
                    if (self.textField.text?.contains("財"))! || (self.textField.text?.contains("錢"))! || (self.textField.text?.contains("富"))! {
                        self.textView.text = wealthy[Int(arc4random()) % wealthy.count]
                    }else if (self.textField.text?.contains("收入"))! {
                        self.textView.text = "如果你不一直更換工作的話，收入才會比較高，但相對的，你也可能錯失了一些被挖角的機會。"
                    }else if (self.textField.text?.contains("健康"))! {
                        self.textView.text = "為了自己人生努力的同時，你也不會忘記自己的身體健康，憑藉著你的自律以及適時的放鬆，雖然很累，但你總能感到自己的身體仍然有著些許的活力。"
                    }else if (self.textField.text?.contains("身體"))! {
                        self.textView.text = "未來的環境會越來越差，不過因為你有在注意自己的身體，所以身體還好，但是還是要再比現在更加注意一點，不然隨著年紀增長，只會覺得身體一天越不如一天。"
                    }else if (self.textField.text?.contains("人生"))! || (self.textField.text?.contains("未來"))! || (self.textField.text?.contains("方向"))! {
                        self.textView.text = life[Int(arc4random()) % life.count]
                    }else if (self.textField.text?.contains("男友"))! || (self.textField.text?.contains("女友"))! {
                        self.textView.text = love[Int(arc4random()) % love.count]
                    }else if (self.textField.text?.contains("運勢"))!{
                        self.textView.text = all[Int(arc4random()) % all.count]
                    }else{
                        self.textView.text = "這不重要，問點重要的吧！！"
                    }
                    
                    self.cleanBtn.isHidden = false
                
                })
                
                textField.resignFirstResponder()
            }else{
                let alert = UIAlertController(title: "Oops", message: "尚未輸入想問的問題唷", preferredStyle: .alert)
                let btn = UIAlertAction(title: "好的", style: .default, handler: { (btn) in
                })
                alert.addAction(btn)
                self.present(alert, animated: true, completion: nil)

        }
        
    }
    
    func cleanTheAnswer() {
        textView.text = ""
        textField.text = ""
        cleanBtn.isHidden = true
    }
}

