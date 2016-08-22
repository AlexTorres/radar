//
//  ResultWireFrame
//  Radar
//
//  Created by John Alexandert Torres on 8/19/16.
//  Copyright © 2016 meridian. All rights reserved.
//

import Foundation

class ResultWireFrame {
  init (viewProtocol view: ResultViewProtocol) {
    let presenter: protocol<ResultPresenterProtocol, ResultManagerOutputProtocol> = ResultPresenter()
    let manager: ResultInputManagerProtocol = DataManager()
    // Conections
    view.presenter = presenter
    presenter.manager = manager
    manager.presenter = presenter
    presenter.view = view
  }
}
