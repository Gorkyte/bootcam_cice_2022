//
//  ListaPerfilPostViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by CICE on 26/01/2022.
//

import UIKit

class ListaPerfilPostViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var miPerfilposttableView: UITableView!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()


        // Do any additional setup after loading the view.
    }

    private func configuracionTableView(){
        self.miPerfilposttableView.delegate = self
        self.miPerfilposttableView.dataSource = self
        
        self.miPerfilposttableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
        
        self.miPerfilposttableView.register(UINib(nibName: PostCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PostCell.defaultReuseIdentifier)
        }

}


extension ListaPerfilPostViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
                
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.miPerfilposttableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.delegate = self
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Gorka Ormazabal Zuriarrain",
                                                           descripcionPerfil: "Senior lead IOS Engineer en CICE,rem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                           puestoActualPerfil: "Senior Lead IOS Engineer",
                                                           usuarioLinkedinPerfil: "@gorkaormaz",
                                                           imagePerfil: "thor"))
            return cellPerfil
            
        default:
            
            let cellPost = self.miPerfilposttableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier, for: indexPath) as! PostCell
            cellPost.setupPostCell(data: UserDataModel(nombrePerfil: "Miranda",
                                                       descripcionPerfil: "Senior lead IOS Engineer en CICE,rem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieranSenior lead IOS Engineer en CICE,rem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                       puestoActualPerfil: "Senior Lead IOS Engineer",
                                                       usuarioLinkedinPerfil: "miranda@miranda.com",
                                                       imagePerfil: "Miranda_Lambert"))
                                   
             return cellPost
            
        }
    }
    
    
}

extension ListaPerfilPostViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 265
        default:
            return 400//UITableView.automaticDimension
        }
    }
    
}


extension ListaPerfilPostViewController: PerfilCellOutputDelegate {
    func showAlertB1() {
        let alertVC = UIAlertController(title: "Explota la cabexa", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction (title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
        
    }


    func showAlertB2() {
        let alertVC = UIAlertController(title: "Explota la cabexa", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction (title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func navigationToDetailView(withData: UserDataModel?) {
        let alertVC = UIAlertController(title: "Explota la cabexa", message: withData?.nombrePerfil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction (title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }


}
