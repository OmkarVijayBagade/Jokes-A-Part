//
//  ActivityView.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 29/11/25.
//

import SwiftUI
import UIKit

struct ActivityView: UIViewControllerRepresentable {
    let items: [Any]
    let completion: (() -> Void)?

    init(items: [Any], completion: (() -> Void)? = nil) {
        self.items = items
        self.completion = completion
    }

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        vc.completionWithItemsHandler = { _, _, _, _ in
            DispatchQueue.main.async {
                completion?()
            }
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
