//
//  Employee.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import Foundation

struct Employee: Identifiable {
    let id: Int
    let name: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let postalCode: String
    let avatarURL: URL?
    let department: Department
    let gender: Gender
}

extension EmployeeDTO {
    var toEmployee: Employee {
        Employee(
            id: id,
            name: firstName,
            lastName: lastName,
            username: username,
            email: email,
            address: address,
            postalCode: zipcode,
            avatarURL: avatar.flatMap { URL(string: $0) },
            department: Department(rawValue: department.id) ?? .unknown,
            gender: Gender(rawValue: gender.id) ?? .unknown
        )
    }
}
