import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick.Controls 2.4


import ClipBoard 1.0

Window {

    id: root

    visible: true
    width: 300
    minimumHeight: 480
    flags: "FramelessWindowHint"

    Column {
        Rectangle {
            width: parent.width
            height: 30

            Row {
                width: parent.width
                height: parent.height

                Rectangle {
                    width: parent.width
                    height: parent.height

                    Text {
                        text: "WorkAssistent"
                    }

                    MouseArea {
                        anchors.fill: parent
                        property point clickPos: "0, 0"

                        onPressed: {
                            clickPos = Qt.point(mouse.x, mouse.y);
                        }

                        onPositionChanged: {
                            //鼠标偏移量
                            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
                            //如果mainwindow继承自QWidget,用setPos
                            root.setX(root.x + delta.x)
                            root.setY(root.y + delta.y)
                        }

                    }
                }

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

        ListView {
            id: clipTests


        }
    }






}
