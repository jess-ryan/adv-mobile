//
//  EducateViewController.swift
//  Final-Proj
//
//  Created by Jess Ryan on 2/17/22.
//
import UIKit
import SwiftUI
//https://stackoverflow.com/questions/39043032/uiviewanimation-trantitionfromview-using-uiviewflip-animation


class EducateViewController: UIViewController {
    
    let sectionNum = 0
    @State var questionNumber = 0

    @IBOutlet weak var flashCardView: FlashCard!
    @IBOutlet weak var flipbutton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    
    }

    @IBAction func nextButtonPressed(_ sender: UIButton){
        
    }
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        flashCardView.flip()
    }
    

    
    
    /*
   
    
    @IBAction func answerButtonOne(_ sender: Any) {
        
        if checkAnswer(answer: answerButtonOne.titleLabel!.text ?? "") == true{
            correctAlert()
        } else{
            falseAlert()
        }
        
    }
    @IBAction func answerButtonTwo(_ sender: Any) {
        
        if checkAnswer(answer: answerButtonTwo.titleLabel!.text ?? "") == true{
           correctAlert()
        } else{
            falseAlert()
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        tapCount += 1

        //questionLabel.text = quizData[sectionNum].questions[1].questionText
        answerButtonOne.setTitle(quizData[sectionNum].questions[tapCount].answers[0], for: .normal)
        answerButtonTwo.setTitle(quizData[sectionNum].questions[tapCount].answers[1], for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set next button to not clickable until correct answer is picked
        nextButton.isEnabled=false
        
        //load data
        if let data = dataLoader.loadData(fileName: "data"){
            quizData=data
            //questionLabel.text = quizData[sectionNum].questions[0].questionText
            answerButtonOne.setTitle(quizData[sectionNum].questions[0].answers[0], for: .normal)
            answerButtonTwo.setTitle(quizData[sectionNum].questions[0].answers[1], for: .normal)
        }
    
    }
    
    
    
    func checkAnswer(answer: String) -> Bool{
        if answer == quizData[sectionNum].questions[tapCount].answers[quizData[sectionNum].questions[tapCount].correctAnswer]{
            nextButton.isEnabled=true
            return true
        }
        return false
    }
    
    func correctAlert(){
        let alert = UIAlertController(title: "correct", message: "NICE!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func falseAlert(){
        let alert = UIAlertController(title: "WRONG", message: "you picked the wrong answer", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
      
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
*/
}
