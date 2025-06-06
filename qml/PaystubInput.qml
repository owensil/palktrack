import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    width: childrenRect.width
    height: childrenRect.height
    property double cTextHeight: 20
    property double cSpacing: 8

    ColumnLayout {
        id: stubInput
        Layout.fillWidth: true
        spacing: cSpacing

        GridLayout {
            id: payPeriod
            Layout.margins: 8
            Layout.fillWidth: true
            uniformCellHeights: true
            rows: 3
            columns: 2

            Text {
                id: startDateLabel
                text: qsTr("Start Date:")
                horizontalAlignment: Text.AlignLeft
                Layout.fillWidth: true
            }

            DateInput {
                id: startDateInput
            }

            Text {
                id: endDateLabel
                text: qsTr("End Date:")
                Layout.fillWidth: true
            }

            DateInput {
                id: endDateInput
            }

            Text {
                id: payDateLabel
                text: qsTr("Date of Pay:")
                Layout.fillWidth: true
            }

            DateInput {
                id: payDateInput
            }
        }

        RowLayout {
            id: payData
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.margins: 8
            spacing: cSpacing

            ColumnLayout {
                id: payLabels
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                spacing: cSpacing

                Text {
                    id: hoursHeader
                    height: cTextHeight
                    text: qsTr("Hours")
                    font.bold: true
                }

                Text {
                    id: hourlyLabel
                    height: cTextHeight
                    text: qsTr("Hourly")
                }

                Text {
                    id: overtimeLabel
                    height: cTextHeight
                    text: qsTr("Overtime")
                }

                Text {
                    id: totalLabel
                    height: cTextHeight
                    text: qsTr("Total")
                    font.bold: true
                }

                Text {
                    id: taxesHeader
                    height: cTextHeight
                    text: qsTr("Taxes")
                    font.bold: true
                }

                Text {
                    id: medicareLabel
                    height: cTextHeight
                    text: qsTr("Medicare Employee Addl Tax")
                }

                Text {
                    id: federalLabel
                    height: cTextHeight
                    text: qsTr("Federal Withholding")
                }

                Text {
                    id: socsecLabel
                    height: cTextHeight
                    text: qsTr("Soc. Sec. Employee")
                }

                Text {
                    id: medempLabel
                    height: cTextHeight
                    text: qsTr("Medicare Employee")
                }

                Text {
                    id: stateLabel
                    height: cTextHeight
                    text: qsTr("State Withholding")
                }

                Text {
                    id: netPayLabel
                    height: cTextHeight
                    text: qsTr("Net Pay")
                    font.bold: true
                }
            }

            ColumnLayout {
                id: payQty
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                spacing: cSpacing
                Layout.preferredWidth: 60

                Text {
                    id: qtyText
                    height: cTextHeight
                    text: qsTr("Qty")
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    font.bold: true
                }

                TextInput {
                    id: hoursInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    horizontalAlignment: Text.AlignRight
                    activeFocusOnTab: true
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                }

                TextInput {
                    id: overtimeInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignRight
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                }
            }

            ColumnLayout {
                id: payRate
                width: payRate.implicitWidth
                height: payRate.implicitHeight
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                spacing: cSpacing
                Layout.preferredWidth: 60

                Text {
                    id: rateText
                    height: cTextHeight
                    text: qsTr("Rate")
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    font.bold: true
                }

                TextInput {
                    id: hourlyRateInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                }

                TextInput {
                    id: overtimeRateInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                }
            }

            ColumnLayout {
                id: payCurrent
                spacing: cSpacing
                Layout.preferredWidth: 60

                Text {
                    id: payText
                    height: cTextHeight
                    text: qsTr("Pay")
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    font.bold: true
                }

                TextInput {
                    id: hourlyPayInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                TextInput {
                    id: overtimePayInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                TextInput {
                    id: totalPayInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                Text {
                    id: dummyText
                    height: cTextHeight
                    text: qsTr("")
                    Layout.alignment: Qt.AlignHCenter
                }

                TextInput {
                    id: medicareInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                TextInput {
                    id: federalInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                TextInput {
                    id: socsecInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                TextInput {
                    id: medempInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                TextInput {
                    id: stateInput
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                }

                Text {
                    id: netPay
                    height: cTextHeight
                    text: qsTr("00.00")
                    activeFocusOnTab: true
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignRight
                    font.bold: true
                }
            }
        }

        Button {
            id: submitButton
            Layout.fillWidth: true
            height: implicitContentHeight
            text: qsTr("Submit")
            Connections {
                target: submitButton
                function onClicked() {
                    console.log("Click")
                }
            }
        }
    }
}
