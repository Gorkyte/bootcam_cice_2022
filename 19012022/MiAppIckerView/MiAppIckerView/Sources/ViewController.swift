//
//  ViewController.swift
//  MiAppIckerView
//
//  Created by CICE on 21/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Variables globales
    let quesosArrayData = ["Mozzarela", "Gorgonzola","Provolone","Stilton","Asiago"]
    
    
    
    
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    @IBOutlet weak var imagenQuesoImv: UIImageView!
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
                          
     
        
    }
    
    // MARK: - Metodos Privados
    
    private func configuracionUI(){
        self.title = "Quesos del Mundo"
        self.tituloQuesoLBL.text = self.quesosArrayData.first
        self.imagenQuesoImv.image = UIImage(named: self.quesosArrayData.first ?? "placeholder")
        
        self.detalleTextQuesoTXV.text = "La mozzarela1 (del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. Por otro lado, es internacionalmente extendida la producción de quesos tipo mozzarella a base de leche de vaca."
  
        
    }

    private func configuracionPickerView(){
        self.pickerQuesoPicV.delegate = self
        self.pickerQuesoPicV.dataSource = self
        
    }


}

// MARK: - extension -> UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        self.tituloQuesoLBL.text = self.quesosArrayData[row]
        self.imagenQuesoImv.image = UIImage(named: self.quesosArrayData[row])
        
        
        switch row {
        case 0:
            self.detalleTextQuesoTXV.text = "La mozzarela1 (del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. Por otro lado, es internacionalmente extendida la producción de quesos tipo mozzarella a base de leche de vaca."
        case 2:
            self.detalleTextQuesoTXV.text = "La Gorgonzola (del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. Por otro lado, es internacionalmente extendida la producción de quesos tipo mozzarella a base de leche de vaca."
        case 3:
            self.detalleTextQuesoTXV.text = "La Provolone (del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. Por otro lado, es internacionalmente extendida la producción de quesos tipo mozzarella a base de leche de vaca."
        case 4:
            self.detalleTextQuesoTXV.text = "La Stilton (del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. Por otro lado, es internacionalmente extendida la producción de quesos tipo mozzarella a base de leche de vaca."
        default:
            self.detalleTextQuesoTXV.text = "La Asiago (del italiano mozzare ‘cortar’ o de su variante regional muzzare, es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di bufala campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. Por otro lado, es internacionalmente extendida la producción de quesos tipo mozzarella a base de leche de vaca."
        }
    }
    
    
}

//MARK: - extension  -> UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.quesosArrayData.count
    }

    
}

