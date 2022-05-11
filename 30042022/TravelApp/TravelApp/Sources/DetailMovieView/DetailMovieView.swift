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

import SwiftUI

struct DetailMovieView: View {

//    @StateObject var viewModel = DetailMovieViewModel()
    var viewModel: DetailMovieServerModel
    //private var imageLoader = ImageLoader()
    @SwiftUI.Environment(\.presentationMode) var presenterMode
       
    var body: some View {
        ScrollView{
            VStack{
                headerView
                bodyView
            }
        }
        
    }
    
    var headerView: some View {
        ZStack(alignment: .topLeading){
            if self.viewModel.posterUrl != nil {
                MovieDetailImage(imageUrl: self.viewModel.posterUrl)
                    
            }
            
            HStack{
                Button {
                    self.presenterMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                    
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()
                
                Button {
                    // Aquí salvaremos las peliculas como favoritas en una BBDD (1. Firebase | 2. UserDefault)
                } label: {
                    Image(systemName: "bookmark")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 20))

      
            }
            .foregroundColor(Color.green)
            
        }
    }
    
    var bodyView: some View {
        
        VStack(alignment: .leading, spacing:  30) {
            HStack{
                Text(self.viewModel.genreText)
                Text("·").fontWeight(.heavy)
                Text(self.viewModel.yearText)
                Text("·").fontWeight(.heavy)
                Text(self.viewModel.durationText)
            }
        }
    }
}

struct MovieDetailImage: View {
    
    let imageUrl: URL
    @StateObject private var imageLoaderVM = ImageLoader ()
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 10)
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
        .onAppear{
            self.imageLoaderVM.loadImage(whit: imageUrl)
        }
    }
}


struct DetailMoviePreviews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(viewModel: DetailMovieServerModel.stubbedDetailMovie!)
       
    }
}
