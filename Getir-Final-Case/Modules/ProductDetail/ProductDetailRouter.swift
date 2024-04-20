//
//  ProductDetailRouter.swift
//  Getir-Final-Case
//
//  Created by Berke Parıldar on 14.04.2024.
//

import Foundation

enum ProductDetailRoutes {
    case cart
}

protocol ProductDetailRouterProtocol: AnyObject {
    func navigate(_ route: ProductDetailRoutes)
}

final class ProductDetailRouter {
    
    weak var viewController: ProductDetailViewController?
    
    static func createModule(product: Product) -> ProductDetailViewController {
        let view = ProductDetailViewController()
        let interactor = ProductDetailInteractor(product: product, productID: product.id)
        let router = ProductDetailRouter()
        
        let presenter = ProductDetailPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}

extension ProductDetailRouter: ProductDetailRouterProtocol {
    func navigate(_ route: ProductDetailRoutes) {
        switch route {
        case .cart:
            /*
            let productDetailVC = ProductDetailRouter.createModule()
            viewController?.navigationController?.pushViewController(productDetailVC, animated: true)
             */
            break
        }
    }
}

