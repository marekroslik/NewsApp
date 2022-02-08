import SwiftUI

struct CourseItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    @Binding var title: String
    @Binding var content: String
    @Binding var urlToImage: String
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(content)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
            }
            
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 60)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            
            
            AsyncImage(url: URL(string: urlToImage)) { image in
                image
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } placeholder: {
                ProgressView()
            }
        )
        .background(
            Image("Background 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseItem(namespace: namespace, show: .constant(true), title: .constant("Title"), content: .constant("Content"), urlToImage: .constant("Illustration 9"))
    }
}
