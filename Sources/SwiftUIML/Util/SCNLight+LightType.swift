import SceneKit

extension SCNLight.LightType {
  init(_ string: String) {
    switch string.lowercased() {
    case "omni", "point":
      self = .omni
    case "directional":
      self = .directional
    case "spot":
      self = .spot
    case "ambient":
      self = .ambient
    case "area":
      self = .area
    case "probe":
      self = .probe
    case "ies":
      self = .IES
    default:
      self = .omni
    }
  }
}
