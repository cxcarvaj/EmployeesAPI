//
//  RepositoryTest.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import Foundation

struct NetworkTest: DataRepository {
    
    let url = Bundle.main.url(forResource: "EmpleadosTesting", withExtension: "json")!
    
    func load<T>(url: URL, type: T.Type) throws -> T where T: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
    
    func getEmployees() async throws -> [Employee] {
        try load(url: url, type: [EmployeeDTO].self).map(\.toEmployee)
    }
    
    func getEmployee(id: Int) async throws -> Employee {
        .test
    }
    
    func updateEmployee(employee: Employee) async throws {}
}


extension Employee {
    static let test = Employee(id: 1, name: "Julio César", lastName: "Fernández Muñoz", username: "jcfmunoz", email: "jcfmunoz@icloud.com", address: "Mi Casa", postalCode: "Mi CP", avatarURL: URL(string: "https://pbs.twimg.com/profile_images/1017076264644022272/tetffw3o_400x400.jpg"), department: .engineering, gender: .male)
}
