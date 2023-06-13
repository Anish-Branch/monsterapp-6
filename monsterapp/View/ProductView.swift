//
//  ProductView.swift
//  monsterapp
//
//  Created by Zubair Nagori on 13/06/23.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var showDetails: Bool = false
}
struct ProductView: View {
    let product: Product

    @StateObject private var viewModel = ProductViewModel()

    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            productImage
            productType
            productTitle
            Spacer()
                .frame(height: 20)
            productSubTitle
        }
        .fullScreenCover(isPresented: $viewModel.showDetails) {
            ProductDetails(product: product)
        }
        .onTapGesture {
            viewModel.showDetails = true
        }
    }

    @ViewBuilder
    var productImage: some View {
        Image(product.productImage)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .cornerRadius(20)
    }

    @ViewBuilder
    var productType: some View {
        Text(product.type.rawValue)
            .padding()
            .background(
                Capsule()
                    .fill(.bar)
                    .frame(maxHeight: 30)
            )
    }

    @ViewBuilder
    var productTitle: some View {
        Text(product.title)
            .font(.title)
            .fontWeight(.semibold)

    }

    @ViewBuilder
    var productSubTitle: some View {
        Text(product.subtitle)
            .lineLimit(2)

    }

    @ViewBuilder
    var buttonsStack: some View {
        HStack {
            ThemeButton(title: "Add to cart") {

            }
            ThemeButton(title: "Buy now") {

            }

            Button {

            } label: {
                Image(systemName: "square.and.arrow.up")
                    .renderingMode(.template)
                    .foregroundColor(Constants.Colors.themeBlue)
                    .font(.title)
            }

            Button {

            } label: {
                Image(systemName: "bell.fill")
                    .renderingMode(.template)
                    .foregroundColor(Constants.Colors.themeBlue)
                    .font(.title)
            }
        }
        .padding(.horizontal)
    }
}
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(type: .ECOMMERCE, title: "Branch Product", subtitle: "This is a test product", productImage: "ECOMMERCE-1"))
    }
}
