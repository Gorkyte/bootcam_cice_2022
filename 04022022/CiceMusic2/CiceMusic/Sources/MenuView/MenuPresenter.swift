/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import MessageUI


// Input del Presenter
protocol MenuPresenterInputProtocol {
    func fetchDataFromPresenter()
    func nomberOfRows() -> Int
    func informationForRow(indexPath: Int) -> MenuResponse
    
    func showWeSite()
    func showMusicViewController()
    func showCalendarViewController()
    func showTipsViewController()
    
    func sendMail(canSendMail: Bool, delegate: MFMailComposeViewControllerDelegate)
    
}


//Output del Interactor
protocol MenuInteractorOutputProtocol {
    func setDataFromInteractor(data: [MenuResponse])
}

final class MenuPresenter: BasePresenter<MenuPresenterOutputProtocol, MenuInteractorInputProtocol, MenuRouterInputProtocol> {
    var dataSourceMenu: [MenuResponse] = []
}


// Input del Presenter
extension MenuPresenter: MenuPresenterInputProtocol {
    func fetchDataFromPresenter() {
        self.interactor?.fetchDataFromInteractor()
    }
    func nomberOfRows() -> Int {
        return self.dataSourceMenu.count
    }
    
    func informationForRow(indexPath: Int) -> MenuResponse {
        return self.dataSourceMenu[indexPath]
    }
    
    func showWeSite() {
        self.router?.showCustomAlert(delegate: self, model: CustomAlertManager(type: .generalConfirmation))
        
    }
    
    func showMusicViewController() {
        
    }
    func showCalendarViewController(){
        
    }
    func showTipsViewController(){
        self.router?.showTipsTrainingView()
        
    }
    func sendMail(canSendMail: Bool, delegate: MFMailComposeViewControllerDelegate){
        if canSendMail {
            self.router?.canSendMail(delegate: delegate)
        }else {
            self.router?.showCustomAlert(delegate: nil, model: CustomAlertManager(type: .cantSendMail))
        }
        
    }
    
    
    
}

//Output del Interactor
extension MenuPresenter: MenuInteractorOutputProtocol {
    func setDataFromInteractor(data: [MenuResponse]){
        self.dataSourceMenu.removeAll()
        self.dataSourceMenu = data
        self.viewController?.reloadInformationInView()
    }
}

extension MenuPresenter: AlertDefaultViewControllerDelegate {
    func primaryButtonPressed() {
        self.router?.showGenericWebView()
    }
    func secondButtonPressed() {
        //
    }
}
