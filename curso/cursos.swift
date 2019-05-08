//
//  cursos.swift
//  curso
//
//  Created by LABMAC03 on 02/05/19.
//  Copyright © 2019 LABMAC03. All rights reserved.
//

import UIKit

import FirebaseDatabase


class cursos: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   var ref = DatabaseReference.init()
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    
    @IBOutlet weak var txtDuracion: UITextField!
    
    @IBOutlet weak var txtMateria: UITextField!
    
    
    @IBOutlet weak var txtDetalles: UITextField!
    
    var myList:[String] = []
    var handle:DatabaseHandle?
   // var ref :DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        listar()
        
        
    }
    
    
    func listar() {
        myList.removeAll()
        handle = self.ref.child("Curso").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? [String : String]{
                
                self.myList.append(" \(item["Nombre"]!) \(item["Detalles"]!)")
                self.myTableView.reloadData()
                
            }
            
        })
        
    }
    
    @IBAction func btnborrar(_ sender: Any) {
     
        self.ref.child("Curso").child(txtNombre.text!).removeValue()
        listar()
        
    }
    
    @IBAction func btnactualizar(_ sender: Any) {

        self.ref.child("Curso").child(txtNombre.text!).setValue(["Nombre" : txtNombre.text!,"Duracion" : txtDuracion.text!,"Materia" : txtMateria.text!,"Detalles" : txtDetalles.text!])
        listar()
        
    }
    
    
    
    @IBAction func sabebtn(_ sender: Any) {
        
        let txt = ["Nombre" :
            txtNombre.text!,
                   "Duracion" : txtDuracion.text!,
                   "Materia" : txtMateria.text!,
                   "Detalles" : txtDetalles.text!]
        
      //  ref?.child("list").childByAutoId().setValue(txt)
        self.ref.child("Curso").child(txtNombre.text!).setValue(txt)
       /* txtNombre.text! = " "
        txtDuracion.text! = " "
        txtMateria.text! = " "
        txtDetalles.text! = " "*/
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
       let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell
    }
    
    
   
            
    
       // print(myList)
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
}
