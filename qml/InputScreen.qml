import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    width: 1920
    height: 1080

    Rectangle {
        id: rectangle
        width: 1920
        height: 1080

        ColumnLayout {
            id: column

            TabBar {
                id: tabBar
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                rotation: 0

                TabButton {
                    id: ioButton
                    width: ioButton.implicitWidth
                    text: qsTr("Import/Export")

                    Connections {
                        target: ioButton
                        function onClicked() {
                            console.log("clicked")
                        }
                    }
                }

                TabButton {
                    id: tabButton1
                    text: qsTr("Tab Button")
                }

                TabButton {
                    id: tabButton2
                    text: qsTr("Tab Button")
                }
            }

            RowLayout {
                id: row
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                PaystubInput {
                    id: payStubInput
                }

                ShiftInput {
                    id: shiftInput
                    Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                }
            }
        }
    }
}
