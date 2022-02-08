import SwiftUI

struct DetailExloreView: View {
    
    @Binding var item: ResponseBody.Article
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: item.urlToImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(30)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(5)
              
                Text(item.title)
                    .font(.title)
                    .padding(5)
             
                Text(item.content)
                    .font(.caption)
                    .padding(5)
            }
            .padding(5)
        }
        .onAppear{
            UITableView.appearance().separatorColor = .clear
            UITableView.appearance().showsVerticalScrollIndicator = false
        }
    }
}
