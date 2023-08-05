//
//  ButtonAction.swift
//  InstgramClone
//
//  Created by Ecc on 01.08.23.
//

import SwiftUI

struct ButtonAction: View {
    let image: String
    let action : () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            Image(systemName: image)
                .imageScale(.large)
        }    }
}

struct ButtonAction_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAction(image: "paperplane", action: {})
    }
}
