//
//  AddControllerViewController.swift
//  testTodoApp
//
//  Created by 山河絵利奈 on 8/22/19.
//  Copyright © 2019 山河絵利奈. All rights reserved.
//

import UIKit
import RealmSwift

var TodoOneThing = [String]()

class AddViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var TodoTextField: UITextField!
    @IBOutlet weak var TodoDetailField: UITextField!
    @IBOutlet weak var TodoDateField: UIDatePicker!
    
    @IBAction func TodoConfirmButton(_ sender: Any) {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realmDataBase = DBTodo()
        try! realm.write {
            realmDataBase.title = TodoTextField.text!
            realmDataBase.comment = TodoDetailField.text!
            realmDataBase.date = TodoDateField.date
            realm.add(realmDataBase)
            }
        TodoTextField.text = ""
        navigationController!.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TodoTextField.delegate = self
        TodoDetailField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //close keybode
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
