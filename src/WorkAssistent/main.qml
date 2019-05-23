import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick.Controls 2.4


import ClipBoard 1.0

Window {

    id: root

    visible: true
    width: 640
    height: 480
    flags: "FramelessWindowHint"


    Rectangle {
        width: parent.width
        height: 30

        Row {
            width: parent.width
            height: parent.height

            Button {

                id: min_btn
                width: 30
                height: 30

                anchors.right: close_btn.left

                text: "_"
                onClicked: {

                }
            }

            Button {

                id: close_btn

                width: 30
                height: 30

                anchors.right: parent.right

                text: "x"
                onClicked: {
                    Qt.quit();
                }
            }
        }
    }




}
