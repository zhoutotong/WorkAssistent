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
        width: parent.width
        height: 30
        Rectangle {

            id: head
            width: parent.width
            height: 30

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

            Button {
                id: min_btn
                width: 30
                height: 30
                anchors.right: close_btn.left

                text: "_"
                onClicked: {

                }
            }

            Row {
                width: parent.width - close_btn.width - min_btn.width
                height: parent.height

                Rectangle {
                    anchors.fill: parent
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
            }
        }


        ListModel {
            id: test_model
            ListElement {
                text_content: "Bill Smith"
            }
            ListElement {
                text_content: "John Brown"
            }
            ListElement {
                text_content: "Sam Wise"
            }
        }

        ListView {
            id: clipTests

            anchors.top: head.bottom

            width: root.width
            height: root.height - head.height

            model: test_model

            delegate: Rectangle{

                width: root.width
                height: 40
                radius: 5
                border.color: "blue"


                Row {

                    spacing: 2

                    height: parent.height
                    width: parent.width

                    Text {

                        height: parent.height
                        width: parent.width - 40 - parent.spacing

                        anchors.verticalCenter: parent.verticalCenter
                        text: text_content
                    }

                    Column {
                        height: parent.height
                        width: 40
                        spacing: 2

                        Button {
                            width: 40
                            height: parent.height / 2 - 4
                            text: 'A'
                        }

                        Button {
                            width: 40
                            height: parent.height / 2 - 4
                            text: 'B'
                        }

                    }
                }






            }
        }
    }






}
