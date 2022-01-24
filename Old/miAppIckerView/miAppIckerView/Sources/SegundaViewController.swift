//
//  SegundaViewController.swift
//  miAppIckerView
//
//  Created by CICE on 19/01/2022.
//

import UIKit

class SegundaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Variables
    
    let dataSurceLocalidades = ["Salamanca", "La FAtina", "Muencarral", "Gentas"]
    let dataSourceCodigosPostales = ["21001", "22002", "23003", "24004"]
    let dataSourcePrioridadTeletrabajo = ["Altisima", "Media","Baja"]
    let dataSourceFotosPerfil = ["maria", "pedro", "jose","paco"]
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var localicadesTF: UITextField!
    @IBOutlet weak var codigoPostalesTF: UITextField!
    @IBOutlet weak var proridadTrabajoTF: UITextField!
    @IBOutlet weak var perfilImagenView: UIImageView!
    
    override func viewDidLoad () {
        super.viewsDidLoad()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
