//
//  ProductListingRouter.swift
//  Getir-Final-Case
//
//  Created by Berke Parıldar on 9.04.2024.
//

import UIKit

enum ProductListingRoutes {
    case detail(product: Product),
         cart
}

protocol ProductListingRouterProtocol: AnyObject {
    func navigate(_ route: ProductListingRoutes)
}

final class ProductListingRouter {
    
    weak var viewController: ProductListingViewController?
    
    static func createModule() -> ProductListingViewController {
        let view = ProductListingViewController()
        let interactor = ProductListingInteractor()
        let router = ProductListingRouter()
        
        let presenter = ProductListingPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}

extension ProductListingRouter: ProductListingRouterProtocol {
    func navigate(_ route: ProductListingRoutes) {
        switch route {
        case .detail(product: let product):
            guard let window = viewController?.view.window else { return }
            let productDetailVC = ProductDetailRouter.createModule()
            let navigationController = UINavigationController(rootViewController: productDetailVC)
            window.rootViewController = navigationController
        case .cart:
            break
        }
    }
}

