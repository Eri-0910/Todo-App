//
//  ViewController.swift
//  testTodoApp
//
//  Created by 山河絵利奈 on 8/22/19.
//  Copyright © 2019 山河絵利奈. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var text_cont: [String] = ["", "", ""]
    let realm = try! Realm()
    
    //how many rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("start get cell count")
        
        let todo = realm.objects(DBTodo.self)
        
        print("get cell count ok")
        
        return todo.count
    }
    
    //make cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("start make cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoTableViewCell
        let todo = realm.objects(DBTodo.self)
        let oneTodo = todo[indexPath.row]
        cell.todo_title.text = oneTodo.title
        cell.todo_comment.text = oneTodo.comment
        cell.todo_day.text = "\(oneTodo.date)"
        print("make cell ok")
        return cell
    }
    
    //delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let todo = realm.objects(DBTodo.self)
            // これはRealmSwiftでデータを削除しているケース
            let deleteHistory = todo[indexPath.row]
            // トランザクションを開始してオブジェクトを削除します
            try! realm.write {
                realm.delete(deleteHistory)
            }
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    //Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = realm.objects(DBTodo.self)
        let oneTodo = todo[indexPath.row]
        
        text_cont[0] = oneTodo.title
        text_cont[1] = oneTodo.comment
        text_cont[2] = "\(oneTodo.date)"
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetailViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toDetailViewController") {
            let cell: TodoDetailViewController = (segue.destination as? TodoDetailViewController)!
            cell.todo_title = text_cont[0]
            cell.todo_comment = text_cont[1]
            cell.todo_day = text_cont[2]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: "todoCell")
        
        if UserDefaults.standard.object(forKey: "Todo") != nil {
            TodoOneThing = UserDefaults.standard.object(forKey: "Todo") as! [String]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "Todo") != nil {
            TodoOneThing = UserDefaults.standard.object(forKey: "Todo") as! [String]
        }
        tableView.reloadData()
    }


}

