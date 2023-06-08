//
//  UITableViewCell+Reuse.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 08.06.2023.
//

import UIKit

extension UITableView {
    
    func register<T: ReusableView>(cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    func register(cellTypes: [ReusableView.Type]) {
        cellTypes.forEach {
            register(cellType: $0)
        }
    }
    
    func registerHeaderFooter<T: ReusableView>(viewType: T.Type) {
        register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
