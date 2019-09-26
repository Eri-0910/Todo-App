//
//  DB-todo.swift
//  testTodoApp
//
//  Created by 山河絵利奈 on 8/25/19.
//  Copyright © 2019 山河絵利奈. All rights reserved.
//

import Foundation
import RealmSwift

//Class for database using Realm
class DBTodo: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var comment = ""
    @objc dynamic var date:Date = Date()
    
}
