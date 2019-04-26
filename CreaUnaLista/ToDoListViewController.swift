//
//  ViewController.swift
//  CreaUnaLista
//
//  Created by Domenico Tragni on 25/04/2019.
//  Copyright © 2019 Domenico Tragni. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var arrayDiCoseDaFare = ["Comprare verdura","Telefonare in sede","Andare a passeggio"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK - Metodi TableView
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDiCoseDaFare.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        cell.textLabel?.text = arrayDiCoseDaFare[indexPath.row]
        return cell
    }
    
    // MARK - Metodi TableView delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellaSelezionata = arrayDiCoseDaFare[indexPath.row]
        print(cellaSelezionata)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true) // deseleziona la cella
       
        
    }
    //MARK - Aggiunto nuovi items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // creiamo un alert
        let alert = UIAlertController(title: "Aggiungi nuovo elemento", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aggiungi", style: .default) { (action) in
            self.arrayDiCoseDaFare.append(textField.text!)
            self.tableView.reloadData()
            print("Success!")
        }
        // inserisco una text field all'interno del nostro alert
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Inserisci articolo"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
        
    }
}

