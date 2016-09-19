//
//  UserViewModel.swift
//  VersionTwo
//
//  Created by Lauren Nicole Roth on 9/19/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import Foundation
import RxSwift

class UserViewModel {
  
  func getUsers() -> Observable<[SectionModel<String, User>]> {
    return Observable.create { (observable) -> Disposable in
      let users = [User(followersCount: 1005, followingCount: 495, screenName: "BalestraPatrick"),
                   User(followersCount: 380, followingCount: 5, screenName: "RxSwiftLang"),
                   User(followersCount: 36069, followingCount: 0, screenName: "SwiftLang")]
      
      let section = [SectionModel(model: "", items: users)]
      observer.onNext(section)
      observer.onCompleted()
      return AnonymousDisposable{}
    }
  }
}
