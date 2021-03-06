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


//Output del Interactor
protocol ShowsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoAiringToday(data: [ShowsTVModelView]?)
    func setInfoOnTheAir(data: [ShowsTVModelView]?)
    func setInfoPopular(data: [ShowsTVModelView]?)
    func setInfoTopRated(data: [ShowsTVModelView]?)
}



final class ShowsViewModel: BaseViewModel, ObservableObject {
  
    //MARK: - Dependences Inyection (DI)
    var interactor: ShowsInteractorInputProtocol?{
        super.baseInteractor as? ShowsInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var datasourceAiringToday:[ShowsTVModelView] = []
    @Published var datasourceOnTheAir:[ShowsTVModelView] = []
    @Published var datasourcePopular:[ShowsTVModelView] = []
    @Published var datasourceTopRated:[ShowsTVModelView] = []
    
    //MARK: - Metodos publicos para la View
    func fetchData(){
        self.interactor?.fetchDataAiringTodayInteractor()
        self.interactor?.fetchDataOnTheAirInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRatedInteractor()
        
    }
    
}



//Output del Interactor
extension ShowsViewModel: ShowsInteractorOutputProtocol {
    func setInfoAiringToday(data: [ShowsTVModelView]?){
        self.datasourceAiringToday.removeAll()
        self.datasourceAiringToday = data ?? []
        
    }
    
    func setInfoOnTheAir(data: [ShowsTVModelView]?){
        self.datasourceOnTheAir.removeAll()
        self.datasourceOnTheAir = data ?? []
    }
    
    func setInfoPopular(data: [ShowsTVModelView]?){
        self.datasourcePopular.removeAll()
        self.datasourcePopular = data ?? []
    }
    func setInfoTopRated(data: [ShowsTVModelView]?){
        self.datasourceTopRated.removeAll()
        self.datasourceTopRated = data ?? []
    }
    
    
}
