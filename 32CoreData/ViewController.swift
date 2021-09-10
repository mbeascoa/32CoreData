//
//  ViewController.swift
//  32CoreData
//
//  Created by mbeascoa on 10/9/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    
    //INSERTAR REGISTRO
    
    if let miDelegate = UIApplication.shared.delegate as? AppDelegate {
        
        let miContexto = miDelegate.persistentContainer.viewContext
        
        let nuevoNombre = NSEntityDescription.insertNewObject(forEntityName: "Persona",
                                                                into: miContexto)
        nuevoNombre.setValue("Benito Floro", forKey: "Nombre")
        
            do {
               try
                miContexto.save()
            } catch {
               print("Error al guardar el contexto: \(error)")
            }
         
                
                //LECTURA DE DATOS
            
            let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName:"Persona")
           
                if let nombresClientes = try? miContexto.fetch(request) as? [NSManagedObject] {
               for dato in nombresClientes {
                   print(dato.value(forKey: "Nombre")!)
               }
        }

            }
    
}
}


