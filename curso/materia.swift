//
//  materia.swift
//  curso
//
//  Created by LABMAC03 on 02/05/19.
//  Copyright © 2019 LABMAC03. All rights reserved.
//

import UIKit
import FirebaseDatabase
class materia: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var txtMateria: UITextField!
    
    @IBOutlet weak var txtTemas: UITextField!
    
    @IBOutlet weak var txtHorasDuracion: UITextField!
    
    var myList:[String] = []
    var handle:DatabaseHandle?
    var ref :DatabaseReference?
    
    @IBAction func btnguardar(_ sender: Any) {
        
        let txt = ["Materia" :
            txtMateria.text!,
                   "Temas" : txtTemas.text!,
                   "Horas de duracion" : txtHorasDuracion.text!]
        
        self.ref?.child("Materia").childByAutoId().setValue(txt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        
        handle = self.ref?.child("Materia").observe(.childAdded, with: { (snapshot) in
            print(snapshot.value ?? "No item")
            if let item = snapshot.value as? [String : String]{
                
                
                self.myList.append(" \(item["Horas de duracion"]!)")
                self.myTableView.reloadData()
                
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
