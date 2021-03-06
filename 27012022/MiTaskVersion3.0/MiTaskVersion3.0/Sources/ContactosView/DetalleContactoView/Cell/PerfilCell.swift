//
//  PerfilCell.swift
//  MiTaskVersion3.0
//
//  Created by CICE on 01/02/2022.
//

import UIKit

protocol PerfilCellDelegate: AnyObject{
    func showCameraPhoto ()
}


protocol PerfilCellProtocol {
    func configuracionCell(data: ArrayContact)
}


class PerfilCell: UITableViewCell, ReuseIdentifierProtocol{
    
    // MARK: - Variables globales
    weak var delegate:PerfilCellDelegate?
    

    // MARK: IBOutlets
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var usuarioTwitther: UILabel!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var cvPerfil: UILabel!
    
    // MARK: IBActions
    @IBAction func showCameraPhotos(_ sender: Any) {
        
        self.delegate?.showCameraPhoto()
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilCell: PerfilCellProtocol {
    func configuracionCell(data: ArrayContact) {
        
        if let imageData = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kImageProfile) as? Data {
            self.photoProfile.image = UIImage(data: imageData)
        } else {
            self.photoProfile.image = UIImage(named: data.imageProfile ?? "placeholder")
        }
        
        //self.photoProfile.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.usuarioTwitther.text = data.usernameTwitter
        self.nombrePerfil.text = data.firstName
        self.apellidoPerfil.text = data.lastName
        self.cvPerfil.text = data.descriptionCV
    }
}
