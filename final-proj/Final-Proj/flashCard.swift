//
//  flashCard.swift
//  Final-Proj
//
//  Created by Jess Ryan on 4/5/22.
//

import Foundation
import UIKit
import SwiftUI

class ItemView: UIView {

    var label:UILabel?
    var answerButtonOne:UIButton?
    var answerButtonTwo:UIButton?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
    @objc func buttonAction() {
        print("button tapped bitch")
    }

    convenience  init(frame:CGRect, backgroundcolor:UIColor, labelText:String, questionData: question){
        self.init(frame: frame)
        
        self.backgroundColor = backgroundcolor
        self.contentMode = .scaleAspectFit
        
        if labelText=="Back"{
            label = UILabel(frame: CGRect(x: 0,y: 0,width: 250,height: 50))
            label!.textAlignment = NSTextAlignment.center
            label!.textColor = UIColor.white
            label?.center = self.center
            label!.text = questionData.information

           
            self.addSubview(label!)
        }
        if labelText=="Front"{
            label = UILabel(frame: CGRect(x: 0,y: 0,width: 250,height: 50))
            label!.textAlignment = NSTextAlignment.center
            label!.textColor = UIColor.white
            label?.center = self.center
            label!.text = questionData.questionText
            
            answerButtonOne = UIButton()
            answerButtonOne?.setTitleColor(.gray, for: .normal)
            answerButtonOne?.translatesAutoresizingMaskIntoConstraints = false
            answerButtonOne?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            answerButtonOne?.setTitle(questionData.answers[0], for: .normal)
            

            self.addSubview(answerButtonOne!)
            self.addSubview(label!)
            
        }

    }

}


class FlashCard: UIView {
    
    let dataLoader = quizDataLoader()
    var quizData = [quizTopic]()

    var backView:ItemView?
    var frontView:ItemView?
    var isFrontView_CurrentlyVisable_onTheScreen = false


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.isUserInteractionEnabled=true
        
        //load data
        if let data = dataLoader.loadData(fileName: "data"){
            quizData=data
        }
        setupview()


    }

    override init(frame:CGRect){
        super.init(frame: frame)
        self.isUserInteractionEnabled=true
        
        //load data
        if let data = dataLoader.loadData(fileName: "data"){
            quizData=data
        }
        setupview()
    }

    func setupview(){
     loadFront()
     loadBack()
    }

    func loadFront(){

        if frontView == nil {
            frontView = ItemView.init(frame: self.bounds, backgroundcolor: UIColor.red, labelText: "Front", questionData:quizData[0].questions[0])
            self.addSubview(frontView!)
            frontView?.isHidden = true
        }
    }

    func loadBack(){

        if backView == nil {

            backView = ItemView.init(frame: self.bounds, backgroundcolor: UIColor.blue, labelText: "Back", questionData:quizData[0].questions[0])
            self.addSubview(backView!)
            backView?.isHidden = false
        }


    }

    func unloadBack(){
        backView?.removeFromSuperview()
        backView=nil
    }


    func flip(){
        let ObjectToDisplay: ItemView
        let currentlyVisableObjectOnScreen: ItemView

        if isFrontView_CurrentlyVisable_onTheScreen{
            ObjectToDisplay = backView!
            currentlyVisableObjectOnScreen = frontView!
            isFrontView_CurrentlyVisable_onTheScreen = false

        }else{
            ObjectToDisplay = frontView!
            currentlyVisableObjectOnScreen = backView!
            isFrontView_CurrentlyVisable_onTheScreen = true
        }

        if ObjectToDisplay.isHidden{
            ObjectToDisplay.isHidden = false
        }

         print("isFrontView_CurrentlyVisable_onTheScreen?: \(isFrontView_CurrentlyVisable_onTheScreen)")

        UIView.transition(from: currentlyVisableObjectOnScreen, to:ObjectToDisplay, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, completion: {(done)->() in
            if done{
              currentlyVisableObjectOnScreen.isHidden = true
            }
        })
    }


}
