//
//  ViewController.swift
//  miAppIckerView
//
//  Created by CICE on 19/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables globales
    
    let quesosArrayData = ["gouda", "idiazabal", "mozzarela", "permiñan", "provolone" ]
    
    
    
    
    // MARK: - IBoutlests
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    @IBOutlet weak var ImagenQuesoImv: UIImageView!
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
        // Do any additional setup after loading the view.
    }

    
    //MARK: - Metodos privados
    private func configuracionUI(){
        self.title = "Quesos del Mundo"
        self.tituloQuesoLBL.text = self.quesosArrayData.first
        self.detalleTextQuesoTXV.text = "La mozzarella (mozarela,1​ muzarela, muzarella, musarela2​) del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias"
        
      
    }

    private func configuracionPickerView(){
        
        self.pickerQuesoPicV.delegate = self
        self.pickerQuesoPicV.dataSource = self
    }
}

//MARK: - extension -> UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.tituloQuesoLBL.text = self.quesosArrayData[row]
        self.ImagenQuesoImv.image = UIImage(named: self.quesosArrayData[row])

        switch row {
        case 0:
            self.detalleTextQuesoTXV.text = "La gouda (mozarela,1​ muzarela, muzarella, musarela2​) del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias"
        case 1:
            self.detalleTextQuesoTXV.text = "La idiazabal (mozarela,1​ muzarela, muzarella, musarela2​) del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias"
        case 2:
            self.detalleTextQuesoTXV.text = "La mozzarella (mozarela,1​ muzarela, muzarella, musarela2​) del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias"
        case 3:
            self.detalleTextQuesoTXV.text = "La permiñan (mozarela,1​ muzarela, muzarella, musarela2​) del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias"

        default:
            self.detalleTextQuesoTXV.text = "La provolone (mozarela,1​ muzarela, muzarella, musarela2​) del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias"
        }
    }
    
}


// MARK: - extension -> UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    
}
    
 
    




//MARK: - extension -> UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func  numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.quesosArrayData.count
    }
    
    
}


