//
//  ContentView.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var vm = EmployeeVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Department.allCases) { dpt in
                    Section {
                        ForEach(vm.getEmployeeByDpt(dpt: dpt)) { employee in
                            NavigationLink(value: employee) {
                                EmployeeCell(employee: employee)
                            }
                        }
                    } header: {
                        Text(dpt.description)
                    }
                }
            }
            .navigationTitle("Employees")
            .navigationDestination(for: Employee.self) { employee in
                EmployeeEditView(vm: EmployeeEditVM(employee: employee))
            }
        }
        .alert("Employees data error", isPresented: $vm.showAlert) {
            
        } message: {
            Text(vm.errorMsg)
        }

    }
}

#Preview {
    ContentView(vm: EmployeeVM(repository: NetworkTest()))
}
