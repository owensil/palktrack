import QtQuick

Item {
    id: root
    width: 120
    height: 20
    property double text: dateInput.text

    Rectangle {
        color: "#bdeaa3"
        width: 120
        height: 20
        anchors.centerIn: parent
    }

    TextInput {
        id: dateInput
        text: ""
        width: 120
        height: 20
        anchors.centerIn: parent
        activeFocusOnTab: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        inputMethodHints: Qt.ImhDate
        inputMask: "99/99/9999"
    }
}
