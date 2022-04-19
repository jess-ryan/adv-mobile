//
//  MainTableViewController.swift
//  lab-5
//
//  Created by Jess Ryan on 2/28/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var trivias = [Trivia]()
    var dataHandler = TriviaDataHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPIdata()
        tableView.dataSource = self

        
    }

    // MARK: - Table view data source
    
    func getAPIdata() {
            Task {
                await dataHandler.loadjson()
                trivias = dataHandler.getTrivia()
                self.tableView.reloadData()
                //self.reloadInputViews()
                print("Number of trivia \(trivias.count)")
            }
        }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("num of rows:", trivias.count)
        return trivias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = trivias[indexPath.row].question
        cell.contentConfiguration = cellConfig

        // Configure the cell...

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let alert = UIAlertController(title: trivias[indexPath.row].correct_answer, message: nil, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "okay, cool", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
           tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been choosen
       }

}
