import SwiftUI

public struct TabViewProvider {
    let systemImageName: String
    let tabName: String
    let viewProvider: () -> AnyView
    
    public init(
        systemImageName: String,
        tabName: String,
        viewProvider: @escaping () -> AnyView
    ) {
        self.systemImageName = systemImageName
        self.tabName = tabName
        self.viewProvider = viewProvider
    }
}

public struct Tabbar: View {
    
    let tabProviders: [TabViewProvider]
    
    public init(tabProviders: [TabViewProvider]) {
        self.tabProviders = tabProviders
    }
    
    public var body: some View {
        TabView {
            ForEach(tabProviders, id: \.tabName) { tabProvider in
                tabProvider.viewProvider()
                    .tabbarItem(
                        systemImageName: tabProvider.systemImageName,
                        tabName: tabProvider.tabName
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(tabProviders: [
            .init(
                systemImageName: "heart.circle.fill",
                tabName: "First",
                viewProvider: { return AnyView(Text("First Tab")) }
            ),
            .init(
                systemImageName: "heart.fill",
                tabName: "Second",
                viewProvider: { return AnyView(Text("Second Tab")) }
            ),
        ])
    }
}
