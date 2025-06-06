import QtQuick
import palktrack

Window {
    id: page
    width: 640
    height: 480
    visible: true
    title: qsTr("Palktrack")

    WorkDatabase {
        id: db
    }

    // InputScreen {
    //     id: inputScreen
    // }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            db.dummyMethod()
        }
    }
}
