

import Foundation



struct SecondLayerAuth: Codable {
    let formData: [FirstLayerAuth]
    let mode: String
}

struct FirstLayerAuth: Codable {
    let key: String
    let value: String
    let description: String
}
