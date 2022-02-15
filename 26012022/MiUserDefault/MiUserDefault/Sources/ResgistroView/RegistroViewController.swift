//
//  RegistroViewController.swift
//  MiUserDefault
//
//  Created by CICE on 27/01/2022.
//

import UIKit

class RegistroViewController: UIViewController {

    // MARK: - Variables globales
    var existeFoto = false
    var ususarioLogado = false
    
    // MARK: IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var ImagenPerfil: UIImageView!
    @IBOutlet weak var fechaActualizacionLBL: UILabel!
    
    // MARK: - IBActions
    @IBAction func guardarDatosACTION(_ sender: Any) {
        
        
    }
    
    @IBAction func recuperarDatosACTION(_ sender: Any) {
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.configuracionImageView()
        // Do any additional setup after loading the view.
    }



 
    private func datosCumplimentados () -> Bool {
        return !(self.nombreTF.text?.isEmpty ?? false) &&
            !(self.apellidoTF.text?.isEmpty ?? false) &&
            !(self.direccionTF.text?.isEmpty ?? false) &&
            !(self.telefonoTF.text?.isEmpty ?? false) && existeFoto
    }
    
    private func configuracionImageView () {
        self.ImagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(muestraSelectorFoto))
        self.ImagenPerfil.addGestureRecognizer(tapGR)
    }
    
    @objc
    func muestraSelectorFoto(){
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoMenu()
            
        } else {
            self.muestraPhotoLibrary()
        }
        
    }
    
    private func muestraPhotoMenu (){
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.tomarFoto()
        }))
        actionSheetVC.addAction(UIAlertAction(title: "Escoger de la libreria", style: .default, handler: { _ in
            self.muestraPhotoLibrary()
        }))
        self.present(actionSheetVC, animated: true, completion: nil)
        
        
    }
    
  
    private func muestraPhotoLibrary (){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
               
    }
    
    private func tomarFoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
 
    
}






extension RegistroViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImageUnw = info[.originalImage] as? UIImage {
            self.ImagenPerfil.contentMode = .scaleAspectFill
            self.ImagenPerfil.image = pickerImageUnw
            self.existeFoto = true
        }
        
        // Codigo defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    
}

