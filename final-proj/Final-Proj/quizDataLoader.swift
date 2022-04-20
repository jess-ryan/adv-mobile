//
//  quizDataLoader.swift
//  Final-Proj
//
//  Created by Jess Ryan on 3/13/22.
//

import Foundation

class quizDataLoader{
    var allData = [quizTopic]()
    
    func loadData(fileName: String) -> [quizTopic]?{
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([quizTopic].self, from: data)
                    return(jsonData)
                    
                } catch {
                    print("error:\(error)")
                }
        } else{
            print("no file to open")
        }
           return nil
    }
    
    func getTitles() -> [String]{
        var titles = [String]()
        for quizTopic in allData{
            titles.append(quizTopic.title)
        }
         return titles
    }
    
    func getProgress() -> [Double]{
        var progresses = [Double]()
        for quizTopic in allData{
            progresses.append(quizTopic.progress)
        }
        return progresses
    }
    
    func getSaved() -> [Bool]{
        var saves = [Bool]()
        for quizTopic in allData{
            saves.append(quizTopic.saved)
        }
        return saves
    }
    
    func getQuestions(title: String) -> [question]{
        if let topic = allData.first(where: {$0.title == title}) {
            return topic.questions
        } else {
            print("could not find topic title to pull question data")
            return [question]()
        }
    }
}




