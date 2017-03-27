//
//  ViewController.swift
//  EzFlip
//
//  Created by Tu on 3/27/17.
//
//

import UIKit

class ViewController: UIViewController {
    var tag = 100
    var rect = UIView()
    var fliped = UIView()
    var needFlip = UIView()
    var isFlip = false
    override func viewDidLoad() {
        super.viewDidLoad()
        draw1()
    }
    
    func draw1(){
        let cellWidth = view.bounds.width/3
        for col in 0..<3{
            for row in 0..<3{
                rect = UIView(frame: CGRect(x: cellWidth*CGFloat(row), y: cellWidth*CGFloat(col)+50, width: cellWidth - 10, height: cellWidth - 10))
                rect.backgroundColor = UIColor.gray
                rect.tag = tag+col*10+row
                print(rect.tag)
                //                fliped = UIView(frame: rect.bounds)
                //                fliped.backgroundColor = UIColor.black
                //                needFlip = UIView(frame: rect.bounds)
                //                needFlip.backgroundColor = UIColor.gray
                //                rect.addSubview(needFlip)
                view.addSubview(rect)
            }
        }
    }
    
    func flip1(){
        for rect in view.subviews{
            for col in 0..<3{
                // delay(0.5 * Double(col), closure: {
                for row in 0..<3{
                    //self.delay(0.5 * Double(row), closure: {
                    if rect.tag == self.tag+col*10+row{
                        print(rect.tag)
                        //print(rect.layer.isHidden)
                        delay(Double(col) * 1.5 + Double(row) * 0.5, closure: {
                            if self.isFlip == false {
                                UIView.transition(with: rect, duration: 0.5, options: .transitionFlipFromRight, animations: {
                                    rect.backgroundColor = UIColor.black
                                }, completion: { (Bool) in
                                    self.isFlip = true
                                })
                                self.isFlip = true
                            }else {
                                //print(rect.layer.isHidden)
                                UIView.transition(with: rect, duration: 0.5, options: .transitionFlipFromRight, animations: {
                                    rect.backgroundColor = UIColor.gray
                                }, completion: { (Bool) in
                                    self.isFlip = false
                                })
                                self.isFlip = false
                            }
                            
                        })
                    }
                    //})
                }
                
                // })
            }
        }
    }
    
    func flip2(){
        for rect in view.subviews{
            for col in 0..<3{
                for row in 0..<3{
                    if rect.tag == tag+col*10+row{
                        UIView.transition(from: needFlip, to: fliped, duration: 0.5, options: .transitionFlipFromRight, completion: nil)
                    }
                }
            }
        }
    }
    func delay(_ delay:Double, closure:@escaping ()->()){
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    @IBAction func act_Flip(_ sender: Any) {
        flip1()
    }
    
}

