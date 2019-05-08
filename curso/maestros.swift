//
//  maestros.swift
//  curso
//
//  Created by LABMAC03 on 02/05/19.
//  Copyright © 2019 LABMAC03. All rights reserved.
//

import UIKit
import FirebaseDatabase
class maestros: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell    }
    
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtedad: UITextField!
    
    @IBOutlet weak var txtCarrera: UITextField!
    
    @IBOutlet weak var txtcorreo: UITextField!
    
    @IBOutlet weak var txtcelulaProfecional: UITextField!
    var myList:[String] = []
    var handle:DatabaseHandle?
    var ref :DatabaseReference?
    @IBAction func btnGuardar(_ sender: Any) {
        let txt = ["Nombre" :
            txtNombre.text!,
                   "Edad" : txtedad.text!,
                   "Carrera" : txtCarrera.text!,
                   "Correo" : txtcorreo.text!,
                   "Celula Profecional" : txtcelulaProfecional.text!]
        
        //  ref?.child("list").childByAutoId().setValue(txt)
        self.ref?.child("Maestros").childByAutoId().setValue(txt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        handle = ref?.child("Maestros").observe(.childAdded, with: { (snapshot) in
            
            if let item = snapshot.value as? String
            {
                self.myList.append(item)
                //self.myTableView.reloadData()
            }
            
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
