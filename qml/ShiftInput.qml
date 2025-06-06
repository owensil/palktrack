import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    width: childrenRect.width
    height: childrenRect.height
    property double cTextHeight: 20
    property double cSpacing: 8

    ButtonGroup {
        id: cGroup
    }

    ColumnLayout {
        id: shiftInput

        RowLayout {
            id: shiftDateInput
            Layout.margins: cSpacing

            Text {
                id: text1
                width: contentWidth
                height: cTextHeight
                text: qsTr("Date: ")
            }

            DateInput {
                id: shiftDate
            }

            Button {
                id: dateIncButton
                width: 40
                height: cTextHeight
                text: qsTr("/\\")
                Layout.maximumWidth: 40
                Layout.maximumHeight: cTextHeight
            }

            Button {
                id: dateDecButton
                width: 40
                height: cTextHeight
                text: qsTr("\\/")
                Layout.maximumWidth: 40
                Layout.maximumHeight: cTextHeight
            }
        }

        RowLayout {
            id: shiftHourContainer
            Layout.margins: cSpacing

            ColumnLayout {
                id: shiftHourLabels
                width: 100
                height: 100
                spacing: cSpacing

                Text {
                    id: shiftStartHour
                    text: qsTr("Start Hour:")
                }

                Text {
                    id: shiftEndHour
                    text: qsTr("End Hour:")
                }
            }

            ColumnLayout {
                id: shiftHourInput
                width: 100
                height: 100
                spacing: cSpacing

                TextInput {
                    id: textInput1
                    width: 80
                    height: 20
                    text: qsTr("00:00")
                    activeFocusOnTab: true
                    inputMask: "99:99"
                }

                TextInput {
                    id: textInput2
                    width: 80
                    height: 20
                    text: qsTr("24:00")
                    activeFocusOnTab: true
                    inputMask: "99:99"
                }
            }
        }

        RowLayout {
            id: presetsHeader
            width: 100
            height: 100

            CheckBox {
                id: presetsToggle
                text: qsTr("Use Shift Preset")
            }
        }

        ColumnLayout {
            id: shiftPresets
            width: 100
            height: 100
            Layout.margins: cSpacing

            RowLayout {
                id: rowLayout1
                width: 100
                height: 100

                CheckBox {
                    id: checkBox
                    text: qsTr("")
                    ButtonGroup.group: cGroup
                }

                TextInput {
                    id: presetStart
                    width: 80
                    height: 20
                    text: qsTr("00:00")
                    inputMask: "99:99"
                }

                TextInput {
                    id: presetEnd
                    width: 80
                    height: 20
                    text: qsTr("00:00")
                    inputMask: "99:99"
                }
            }

            RowLayout {
                id: rowLayout2
                width: 100
                height: 100

                CheckBox {
                    id: checkBox1
                    text: qsTr("")
                    ButtonGroup.group: cGroup
                }

                TextInput {
                    id: presetStart1
                    width: 80
                    height: 20
                    text: qsTr("00:00")
                    inputMask: "99:99"
                }

                TextInput {
                    id: presetEnd1
                    width: 80
                    height: 20
                    text: qsTr("00:00")
                    inputMask: "99:99"
                }
            }
        }

        ColumnLayout {
            id: shiftHourSubmit
            width: 100
            height: 100
            spacing: cSpacing
            Layout.fillWidth: true

            Button {
                id: button2
                text: qsTr("Submit")
                Layout.fillWidth: true
            }
        }
    }
}
