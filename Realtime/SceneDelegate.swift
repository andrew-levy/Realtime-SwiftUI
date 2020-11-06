//
//  SceneDelegate.swift
//  Realtime
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(
        rootView: RootView().environmentObject(ViewRouter.shared)
      )
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}

struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
