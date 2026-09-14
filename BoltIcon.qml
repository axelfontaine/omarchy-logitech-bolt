import QtQuick
import QtQuick.Shapes

// Logitech's Logi Bolt hexagon icon mark, extracted and recolored from the
// public-domain SVG on Wikimedia Commons: this logo "consists only of
// simple geometric shapes ... and is therefore in the public domain"
// (File:Logi_Bolt_hexagon_icon.svg, commons.wikimedia.org).
Item {
  id: root

  readonly property real nativeW: 116.667
  readonly property real nativeH: 100

  property real iconSize: 16
  property color color: "white"

  implicitWidth: iconSize * (nativeW / nativeH)
  implicitHeight: iconSize

  // Centered first via anchors, then scaled around its own (already
  // centered) origin — more robust than scaling around a corner, which
  // only stays centered if the surrounding sizes line up exactly right.
  Item {
    id: shapeHolder
    width: root.nativeW
    height: root.nativeH
    anchors.centerIn: parent
    scale: root.iconSize / root.nativeH

    Shape {
      anchors.fill: parent
      antialiasing: true
      layer.enabled: true
      layer.samples: 4

      ShapePath {
        fillColor: root.color
        fillRule: ShapePath.OddEvenFill
        strokeWidth: 0
        PathSvg {
          path: "M 67.984 100.000 L 30.787 44.385 L 58.333 44.385 L 30.908 2.313 L 0.000 50.000 L 32.407 100.000 Z M 84.393 99.794 L 116.667 50.000 L 84.259 0.000 L 47.108 0.000 L 82.639 56.413 L 55.903 56.413 Z"
        }
      }
    }
  }
}
