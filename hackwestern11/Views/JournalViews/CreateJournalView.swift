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
    @State private var emotionType = "Happy"
    @State private var amount: String = ""
    @State private var entryText = ""
    
    @Binding var refreshID: UUID
    
    let entryTypes = ["Purchase Reflection", "Savings Reflection", "Budget Adjustment", "Financial Milestone", "Mental Reflection"]
    let emotionTypes = ["Happy", "Neutral", "Sad", "Angry"]
    
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
                
                Section(header: Text("Feeling")) {
                    Picker("Select Feeling", selection: $emotionType) {
                        ForEach(emotionTypes, id: \.self) { type in
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
        var imageString: String {
            switch emotionType {
            case "Happy":
                return "happyface"
            case "Neutral":
                return "neutralface"
            case "Sad":
                return "sadface"
            case "Angry":
                return "angryface"
            default:
                return "happyface"
            }
        }
        let newEntry = JournalEntry(title: title, entryType: entryType, amount: amount, entryText: entryText, imageString: imageString)
        //newEntry.dateCreated = Date()
        context.insert(newEntry)
        refreshID = UUID()
    }
}
