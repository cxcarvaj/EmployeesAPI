//
//  EmpleadoDTO.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import Foundation

struct EmployeeDTO: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String
    let avatar: String?
    let department: DepartmentDTO
    let gender: GenderDTO
    
    struct DepartmentDTO: Codable {
        let id: Int
        let name: String
    }
    
    struct GenderDTO: Codable {
        let id: Int
        let gender: String
    }
}
