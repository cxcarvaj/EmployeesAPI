//
//  EmployeeEdit.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

@Observable
final class EmployeeEditVM {
    let employee: Employee
    
    var name: String
    var lastName: String
    var username: String
    var email: String
    var address: String
    var postalCode: String
    var avatarURL: URL?
    var department: Department
    var gender: Gender
    
    init(employee: Employee) {
        self.employee = employee
        self.name = employee.name
        self.lastName = employee.lastName
        self.username = employee.username
        self.email = employee.email
        self.address = employee.address
        self.postalCode = employee.postalCode
        self.avatarURL = employee.avatarURL
        self.department = employee.department
        self.gender = employee.gender
    }
    
}
