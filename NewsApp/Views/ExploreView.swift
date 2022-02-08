import SwiftUI

struct ExploreView: View {
    
    @State var hasScrolled = false
    var newsManager = NewsManager()
    @State var news: ResponseBody?
    
    var body: some View {
        if let news = news {
            NavigationView {
                List (news.articles, id: \.id) { item in
                    Section {
                        NavigationLink(destination: DetailExloreView(item: .constant(item))) {
                            HStack {
                                VStack(alignment: .leading) {
                                    AsyncImage(url: URL(string: item.urlToImage)) { image in
                                        image
                                            .resizable()
                                        
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(5)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
                                    Text("\(item.title)")
                                        .font(.system(size: 18, weight: .bold))
                                        .lineLimit(nil)
                                    
                                    Text("\(item.description)")
                                        .lineLimit(nil)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationBarTitle("News")
                .listRowInsets(EdgeInsets())
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                    UITableView.appearance().showsVerticalScrollIndicator = false
                }
                
            }
            
        }
        else {
           LoadingView()
                .task {
                    do {
                        news = try await newsManager.getNews()
                    } catch {
                        print ("Error \(error)")
                    }
                }
        }
        
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKeys.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKeys.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
