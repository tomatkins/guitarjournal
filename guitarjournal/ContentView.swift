//
//  ContentView.swift
//  guitarjournal
//
//  Created by Tom Atkins on 1/7/20.
//  Copyright © 2020 High Strung Productions LLC. All rights reserved.
//
import CoreData
import SwiftUI

// MARK: - Fruit

@objc(Fruit)
public class Fruit: NSManagedObject {
    
}

extension Fruit: Identifiable {
    // NOTE: This 'id' type must mach the 'selection' type of the picker.
    public var id: String? {
        return name
    }
}

// MARK: - FruitPickerView

struct FruitPickerView: View {
    @Environment(\.managedObjectContext) var context
     
    
    //added array of values for the Picker.
    var fruitname = [
    "apple",
    "orange",
    "strawberry"
    
    ]
    
    @FetchRequest(
            entity: Fruit.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Fruit.name, ascending: true)]
        ) private var fruits: FetchedResults<Fruit>
        @Binding private var selectedFruit: String?
    
        var body: some View {
            Form {
                Section {
                    // NOTE: The selection type must match the identifiable type of the data element.
                    Picker(selection: $selectedFruit, label: Text("Fruit")) {
                        ForEach(self.fruits) { fruit in
                            Text(fruit.name!)
                        }
                    }
                }
            }.navigationBarTitle("Your Favorite Fruit")
        }
    }
    






struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
