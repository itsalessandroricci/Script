//
//  ImportScriptView.swift
//  Script
//
//  Created by Alessandro Ricci on 19/02/24.
//


import SwiftUI

struct ImportScriptView: View {
    
    @State private var searchText = ""
    let columns: [GridItem] =
    [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var fileURL: URL?
    @State private var showingFilePicker = false
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                Button(action: {
                    showingFilePicker = true
                }) {
                    VStack{
                        Image(systemName: "square.and.arrow.down")
                            .font(.system(size: 140))
                        Text("Import File")
                            .font(.system(size:80))
                    }
                    
                    
                }
                .foregroundColor(.black)
                .opacity(0.4)
                
                
                .padding()
                .fileImporter(
                    isPresented: $showingFilePicker,
                    allowedContentTypes: [.plainText, .pdf],
                    allowsMultipleSelection: false
                ) { result in
                do {
                    fileURL = try result.get().first
                    // Esegui qui l'azione con il file URL selezionato
                    // Ad esempio, puoi leggere il contenuto del file
                } catch {
                    // Gestisci gli errori
                    print("Error importing file: \(error.localizedDescription)")
                }
            }
        }
        .foregroundColor(.black)
        .opacity(0.4)
        .navigationBarItems(trailing: Button(action:
                                                {
            showingFilePicker = true
        })
                            {
            Image(systemName: "plus").foregroundColor(.black)
                .font(.system(size: 20))
        })
        .navigationTitle("Scripts")
        .searchable(text: $searchText)
        
        
    }
    }
}


#Preview {
    ImportScriptView()
}
