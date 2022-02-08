import SwiftUI

struct HomeView: View {
    
    var newsManager = NewsManager()
    @State var news: ResponseBody?
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var pickedNumber: Int?
    
    
    var body: some View {
        if let news = news {
            ZStack {
                Color("Background").ignoresSafeArea()
                
                ScrollView {
                    
                    scrollDetection
                    
                    Text("hot".uppercased())
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    
                    featured
                    
                    Text("All news today".uppercased())
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    
                    if !show {
                        
                        CourseItem(namespace: namespace, show: $show,
                                   title: .constant(news.articles[0].title),
                                   content: .constant(news.articles[0].content),
                                   urlToImage: .constant(news.articles[0].urlToImage))
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    show.toggle()
                                    pickedNumber = 0
                                }
                            }
                    }
                    
                }
                .coordinateSpace(name: "scroll")
                .safeAreaInset(edge: .top, content: {
                    Color.clear.frame(height: 70)
                })
                .overlay(
                    NavigationBar(title: "News", hasScrolled: $hasScrolled)
                )
                
                if show {
                    CourseView(namespace: namespace, show: $show,
                               title: .constant(news.articles[0].title),
                               content: .constant(news.articles[0].content),
                               urlToImage: .constant(news.articles[0].urlToImage)
                    )
                }
                
            }
        } else {
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
    
    var featured: some View {
        
        TabView {
            ForEach(1...5, id: \.self) { number in
                GeometryReader { proxy in
                    
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItem(title: .constant(news!.articles[number].title))
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 100))
                        .frame(maxWidth: .infinity)
                        .overlay(
                            
                            AsyncImage(url: URL(string: news?.articles[number].urlToImage ?? "")) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(30)
                                
                                    .frame(maxWidth: 250)
                            } placeholder: {
                                ProgressView()
                            }
                                .frame(height: 150)
                                .offset(x: 22, y: -80)
                                .offset(x: minX/2)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
