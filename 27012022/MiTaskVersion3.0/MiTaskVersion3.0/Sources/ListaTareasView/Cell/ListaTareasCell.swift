//
//  ListaTareasCell.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 04/02/2022.
//

import UIKit




class ListaTareasCell: UITableViewCell {

   
    // MARK: IBOutlets
    @IBOutlet weak var imagePerfilTareas: UIImageView!
    @IBOutlet weak var namePerfilTareas: UILabel!
    @IBOutlet weak var proridadTareas: UILabel!
    @IBOutlet weak var customcontentViewTareas: UIView!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI(){
        self.imagePerfilTareas.layer.cornerRadius = self.imagePerfilTareas.frame.width / 2
        self.imagePerfilTareas.layer.borderWidth = 1
        self.imagePerfilTareas.layer.borderColor = UIColor.gray.cgColor
        self.customcontentViewTareas.layer.cornerRadius = 10
        self.customcontentViewTareas.layer.borderWidth = 0.3
        self.customcontentViewTareas.layer.borderColor = UIColor.lightGray.cgColor
        self.addShadow(customObject: self.customcontentViewTareas)
    }
    
   
    func addShadow(customObject: UIView){
        customObject.layer.shadowColor = UIColor.black.cgColor
        customObject.layer.shadowOpacity = 0.5
        customObject.layer.shadowRadius = 2.0
        customObject.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)//CGSizeMake(1.0, 1.0)
        
    }
    
    
    
    
}
