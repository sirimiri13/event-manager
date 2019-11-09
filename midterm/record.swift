//
//  record.swift
//  midterm
//
//  Created by Lam Huong on 11/5/19.
//  Copyright © 2019 Lam Huong. All rights reserved.
//

import Foundation
import RealmSwift 

class myGuests : Object {
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var guest: String?
    @objc dynamic var table: String?
    @objc dynamic var section: String?
}
