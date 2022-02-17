//
//  AlertDefaultViewController.swift
//  CiceMusic
//
//  Created by CICE on 16/02/2022.
//

import UIKit

protocol AlertDefaultViewControllerDelegate: AnyObject {
    func primaryButtonPressed()
    func secondButtonPressed()
}

class AlertDefaultViewController: UIViewController {

    //MARK: - Variables globales
    var alertManager: CustomAlertManager?
    var type: DefaultAlertType?
    weak var delegate: AlertDefaultViewControllerDelegate?
    

    
    //MARK: - IBOutlets
    @IBOutlet weak var tittleAlertLBL: UILabel!
    @IBOutlet weak var messageAlertLBL: UILabel!
    @IBOutlet weak var primaryBTN: UIButton!
    @IBOutlet weak var secondaryBTN: UIButton!
    @IBOutlet weak var closeBTN: UIButton!
    
    @IBOutlet weak var constHeightButtonClose: NSLayoutConstraint!
    @IBOutlet weak var constHeightCancelButton: NSLayoutConstraint!
    @IBOutlet weak var constHeightAceptButton: NSLayoutConstraint!
    
    
    @IBOutlet weak var backgroundContentView: UIView!
    @IBOutlet weak var alertContentView: UIView!
    
    
    
    
    
    //MARK: - IBActions
    @IBAction func closeACTION(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func primaryACTION(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.primaryButtonPressed()
        }
    }
    
    @IBAction func secondaryACTION(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.secondButtonPressed()
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 0
        
        self.configuracionUI()

        // Do any additional setup after loading the view.
    }

    private func configuracionUI() {
        
        self.backgroundContentView.alpha = 0.5
        self.primaryBTN.layer.cornerRadius = 25
        self.secondaryBTN.layer.cornerRadius = 25
        self.alertContentView.layer.cornerRadius = 10
        
        switch alertManager?.type{
        case .successLogin:
            self.tittleAlertLBL.text = alertManager?.successLoginTitle
            self.messageAlertLBL.text = alertManager?.successLoginMessage
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.isHidden = true
            self.closeBTN.isHidden = true
            self.constHeightButtonClose.constant = 0
            constHeightCancelButton.constant = 0
        case .failureLogin:
            self.tittleAlertLBL.text = alertManager?.failureLoginTittle
            self.messageAlertLBL.text = alertManager?.failureLoginMessage
            self.primaryBTN.isHidden = true
            self.constHeightAceptButton.constant=0
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        case.cantSendMail:
            self.tittleAlertLBL.text = alertManager?.failureMailTittle
            self.messageAlertLBL.text = alertManager?.failureMailMessage
            self.primaryBTN.isHidden = true
            self.constHeightAceptButton.constant=0
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
        case.generalConfirmation:
            self.tittleAlertLBL.text = alertManager?.confirmationTittle
            self.messageAlertLBL.text = alertManager?.confirmationMessage
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.isHidden = true
            self.closeBTN.isHidden = true
            self.constHeightButtonClose.constant = 0
            self.constHeightCancelButton.constant = 0
        default:
            self.tittleAlertLBL.text = "AQUI GORKA"
            self.messageAlertLBL.text = "Y SI PASA ALGO ???"
            self.primaryBTN.setTitle(alertManager?.primaryButton, for: .normal)
            self.secondaryBTN.setTitle(alertManager?.secondButton, for: .normal)
            
        }
    }

}
