//
//  EmployeeView.swift
//  EmployeesAPI
//
//  Created by Carlos Xavier Carvajal Villegas on 10/4/25.
//

import SwiftUI
import ComponentKit

struct EmployeeEditView: View {
    @State var editVM: EmployeeEditVM
    @Bindable var vm: EmployeeVM
    
    @FocusState private var field: FormsFields?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                Section {
                    CoolTextField(label: "First Name",
                                  placeholder: "Enter the first name of the employee.",
                                  value: $editVM.name,
                                  validation: .isNotEmpty,
                                  isFocused: field == .firstName)
                    .focused($field, equals: .firstName)
                    .textContentType(.name)
                    .textInputAutocapitalization(.words)
                    
                    CoolTextField(label: "Last Name",
                                  placeholder: "Enter the last name of the employee.",
                                  value: $editVM.lastName,
                                  validation: .isNotEmpty,
                                  isFocused: field == .lastName)
                    .focused($field, equals: .lastName)
                    .textContentType(.familyName)
                    .textInputAutocapitalization(.words)


                    CoolTextField(label: "Address",
                                  placeholder: "Enter the address.",
                                  value: $editVM.address,
                                  validation: .isNotEmpty,
                                  isFocused: field == .address)
                    .focused($field, equals: .address)
                    .textContentType(.fullStreetAddress)
                    .textInputAutocapitalization(.words)

                    CoolTextField(label: "ZIP Code",
                                  placeholder: "Enter the ZIP Code.",
                                  value: $editVM.postalCode,
                                  validation: .isNotEmpty,
                                  isFocused: field == .postalCode)
                    .focused($field, equals: .postalCode)
                    .textContentType(.postalCode)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    
                    Label {
                        Text("Gender")
                    } icon: {
                        Picker(selection: $editVM.gender) {
                            ForEach(Gender.allCases) { gender in
                                Text(gender.description)
                            }
                        } label: {
                            Text("Gender")
                        }
                        .pickerStyle(.menu)
                    }
                    .labelStyle(.formLabelStyle)

                } header: {
                    Text("Employee Data")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                }
                
                Section {
                    
                    CoolTextField(label: "Email",
                                  placeholder: "Enter the email of the employee",
                                  value: $editVM.email,
                                  validation: .isEmail,
                                  isFocused: field == .email)
                    .focused($field, equals: .email)


                    CoolTextField(label: "Username",
                                  placeholder: "Enter the username of the employee",
                                  value: $editVM.username,
                                  validation: .isValidUsername,
                                  isFocused: field == .username)
                    .focused($field, equals: .username)
                    .textContentType(.username)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    
                    Label {
                        Text("Department")
                    } icon: {
                        Picker(selection: $editVM.department) {
                            ForEach(Department.allCases) { dpt in
                                Text(dpt.description)
                            }
                        } label: {
                            Text("Department")
                        }
                        .pickerStyle(.menu)
                    }
                    .labelStyle(.formLabelStyle)
                    
                } header: {
                    Text("Professional Data")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                }
            }
        }
        .safeAreaPadding()
        .navigationTitle("Edit Employee")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    Task {
                        await vm.updateEmployee(editVM.updateEmployeeInformation())
                        dismiss()
                    }
                    
                } label: {
                    Text("Save")
                }

            }
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Button {
                        field?.previous()
                    } label: {
                        Image(systemName: "chevron.up")
                    }
                    .disabled(field == .firstName)
                    
                    Button {
                        field?.next()
                    } label: {
                        Image(systemName: "chevron.down")
                    }

                    Spacer()
                    Button {
                        field = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    .disabled(field == .username)

                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EmployeeEditView(editVM: EmployeeEditVM(employee: .test),
                         vm: EmployeeVM(repository: NetworkTest()))
    }
}
