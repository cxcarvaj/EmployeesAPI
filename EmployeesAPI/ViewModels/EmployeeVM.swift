//
//  EmployeeVM.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

@Observable @MainActor
final class EmployeeVM {
    let repository: DataRepository
    
    var employees: [Employee] = []
    
    var showAlert = false
    var errorMsg = ""
    
    init(repository: DataRepository = Network()) {
        self.repository = repository
        Task {
            await getEmployees()
        }
    }
    
    func getEmployees() async {
        do {
            employees = try await repository.getEmployees()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
            print("Error: \(error)")
        }
    }
    
    func getEmployeeByDpt(dpt: Department) -> [Employee] {
         employees.filter { $0.department == dpt }
     }
}
