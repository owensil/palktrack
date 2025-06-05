import QtQuick

Window {
    id: page
    width: 640
    height: 480
    visible: true
    title: qsTr("Palktrack")

    Text {
        id: helloText
        text: "Hello world!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true
    }
}
