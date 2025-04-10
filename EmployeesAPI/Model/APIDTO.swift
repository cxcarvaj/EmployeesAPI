//
//  APIDTO.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import Foundation

struct EmployeeUpdated: Codable {
    let id: Int
    let name: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let postalCode: String
    let avatar: String?
    let department: String
    let gender: String
}

extension Employee {
    var toUpdate: EmployeeUpdated {
        return EmployeeUpdated(
            id: id,
            name: name,
            lastName: lastName,
            username: username,
            email: email,
            address: address,
            postalCode: postalCode,
            avatar: avatarURL?.absoluteString,
            department: department.description,
            gender: gender.description
        )
    }
}
