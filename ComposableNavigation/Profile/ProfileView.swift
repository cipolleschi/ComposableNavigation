//
//  ProfileView.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 16/11/21.
//

import SwiftUI

protocol ProfileService {
    func retrieveProfile() -> String
}

class ProfileViewModel: ObservableObject {
    let networkService: ProfileService
    
    init(networkService: ProfileService) {
        self.networkService = networkService
    }
}

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    init(networkService: ProfileService) {
        self._viewModel = StateObject(wrappedValue: ProfileViewModel(networkService: networkService))
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

//struct ProfileView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        ProfileView(viewModel: ProfileViewModel(networkService: LiveNetworkService()))
//    }
//}
