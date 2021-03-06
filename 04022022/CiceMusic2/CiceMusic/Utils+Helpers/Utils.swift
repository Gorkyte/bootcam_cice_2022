//
//  Utils.swift
//  CiceMusic
//
//  Created by CICE on 06/02/2022.
//

import Foundation
import UIKit
import MessageUI


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELTE"
    case put = "PUT"
    case options = "OPTIONS"
}

enum TargetEnvironment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 3
}


struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method:HTTPMethods
    var endpoint: String
    var urlContext: URLEnpoint.BaseUrlContext
    
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEnpoint {
    
    #if DEV
    static let environmentDefault: TargetEnvironment = TargetEnvironment.DEV
    #elseif PRE
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRE
    #else
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRO
    #endif
    
    enum BaseUrlContext{
        case backend
        case webService
        case heroku
    }
    
    //static let baseUrl = "https://rss.applemarketingtools.com/api/v2/%@/"
    //static let baseUrl = "https://rss.applemarketingtools.com/api/v2/es/"
    
//    static let music = "%@/music/most-played/%@/songs.json"
//    static let podcast = "%@/podcasts/top/%@/podcast-episodes.json"
//    static let books = "%@/books/top-free/%@/books.json"
//    static let apps = "%@/apps/top-free/%@/apps.json"
    static let music = "es/music/most-played/%@/songs.json"
    static let podcast = "es/podcasts/top/%@/podcast-episodes.json"
    static let books = "es/books/top-free/%@/books.json"
    
    
    static let apps = "es/apps/top-free/%@/apps.json"
    
   
    static let menu = "iCoMenuResponse"
    static let tipsTraining = "iCoResponseConsejos"
    
}

extension URLEnpoint{
    static func getUrlBase(urlContext: BaseUrlContext) -> String {
        switch urlContext{
        case.backend:
            switch self.environmentDefault{
            case .DEV:
                return "https://www.azurecloud.com/api/v2/des-mgmt"
            case .PRE:
                return "https://www.azurecloud.com/api/v2/pre-devls"
            case .PRO:
                return "https://www.azurecloud.com/api/v2/pro-mrk"
            }
        case .webService:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://rss.applemarketingtools.com/api/v2/"
            
            
            }
        case .heroku:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://icospartan-app.herokuapp.com/"
            }
        }
    }
}

class Utils {
    struct Constantes {
        let kUsername = "USERNAME"
        let kPassord = "PASSWORD"
        let kUsuarioLogado = "USUARIO_LOGADO"
        let kPrefer = UserDefaults.standard
        let BearerAuthentification = "Bearer 123456789"
        let Authentication = "Authorization"
        
        
    }
    
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
    
    static func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: [String] ) ->  MFMailComposeViewController {
            let mailCompo = MFMailComposeViewController()
            mailCompo.mailComposeDelegate = delegate
            mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.es"])
            mailCompo.setSubject("ese es un mensaje para el equpo de soporte")
            let emailBody = "Los datos del formulario de registro son \(data)"
            mailCompo.setMessageBody(emailBody, isHTML: false)
            return mailCompo
    }
    
    
    
     
}

protocol ReuseIdentifierProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
extension ReuseIdentifierProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}

extension UIViewController {
    func menuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "AppIcon"),//"logoIz"),
                                         style: .plain,
                                         target: revealViewController(),
                                         action: #selector(SWRevealViewController.revealToggle(_:)))
        revealViewController()?.rightViewRevealWidth = 150
        revealViewController()?.panGestureRecognizer()
        self.navigationItem.leftBarButtonItem = menuButton
        
    }

}
