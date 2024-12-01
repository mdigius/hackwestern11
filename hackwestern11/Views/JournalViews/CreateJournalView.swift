//
//  CreateJournalView.swift
//  hackwestern11
//
//  Created by Jacob on 2024-11-30.
//

import SwiftUI
import SwiftData

struct CreateJournalView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var entryType = "Purchase Reflection"
    @State private var amount: String = ""
    @State private var entryText = ""
    
    @Binding var refreshID: UUID
    
    let entryTypes = ["Purchase Reflection", "Savings Reflection", "Budget Adjustment", "Financial Milestone", "Mental Reflection"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Journal Title")) {
                    TextField("Enter title", text: $title)
                }
                
                Section(header: Text("Entry Type")) {
                    Picker("Select Type", selection: $entryType) {
                        ForEach(entryTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Purchase Amount")) {
                    TextField("Enter amount (optional)", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Journal Entry")) {
                    TextEditor(text: $entryText)
                        .frame(height: 200)
                }
            }
            .navigationTitle("Create Journal Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveEntry()
                        dismiss()
                    }
                    .disabled(title.isEmpty || entryText.isEmpty)
                }
            }
        }
    }
    
    private func saveEntry() {
        let newEntry = JournalEntry(title: title, entryType: entryType, amount: amount, entryText: entryText)
        //newEntry.dateCreated = Date()
        context.insert(newEntry)
        refreshID = UUID()
    }
}
