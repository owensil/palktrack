import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 300
    height: 200
    visible: true
    title: "Hello World"


    readonly property list<string> texts: ["Hello World", "Hola Mundo", "World Hello"]

    function setText() {
        var i = Math.round(Math.random() * 2)
        text.text = texts[i]
    }

    ColumnLayout {
        anchors.fill: parent

        Text {
            id: text
            text: "Hello World"
            Layout.alignment: Qt.AlignHCenter
        }
        Button {
            text: "Click Me"
            Layout.alignment: Qt.AlignHCenter
            onClicked: setText()
        }
    }
}