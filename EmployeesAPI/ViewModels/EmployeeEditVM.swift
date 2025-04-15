//
//  EmployeeEdit.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

enum FormsFields {
    case firstName, lastName, username, email, address, postalCode
    
    mutating func next() {
        switch self {
        case .firstName:
            self = .lastName
        case .lastName:
            self = .address
        case .email:
            self = .username
        case .address:
            self = .postalCode
        case .postalCode:
            self = .email
        default: ()
        }
    }
    
    mutating func previous() {
        switch self {
        case .lastName:
            self = .firstName
        case .username:
            self = .email
        case .email:
            self = .postalCode
        case .address:
            self = .lastName
        case .postalCode:
            self = .address
        default: ()
        }
    }
}

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
    
    
    func updateEmployeeInformation() -> Employee {
        Employee(id: employee.id,
                 name: name,
                 lastName: lastName,
                 username: username,
                 email: email,
                 address: address,
                 postalCode: postalCode,
                 avatarURL: avatarURL,
                 department: department,
                 gender: gender)
    }
    
}
