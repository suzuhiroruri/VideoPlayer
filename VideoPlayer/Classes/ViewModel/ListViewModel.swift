//
//  ListViewModel.swift
//  VideoPlayer
//
//  Created by 鈴木 宏昌 on 2019/12/10.
//  Copyright © 2019 Quipper Ltd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListViewModel {

  let requestAPIModel =  APIModel()

  func loadNew() {
    requestAPIModel.videoListAPI(completion: { response in
      switch response {
      case .success(let json):
        print("\n",
              "json",
              "\n",
              json
        )
      case .error:
        return
      }
    })
  }
}
