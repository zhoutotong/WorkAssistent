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

            Rectangle {
                id: close_btn
                anchors.right: parent.right
                width: 30
                height: 30
                color: is_hovered ? "red" : "gray"
                property bool is_hovered: false
                Image {
                    id: close_btn_img
                    width: 30
                    height: 30
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.horizontalCenter: parent.horizontalCenter

                    anchors.right: parent.right
                    source: "qrc:/img/close_btn.png"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        Qt.quit();
                        console.log("mouse clicked");
                    }
                    onHoveredChanged: {
                        close_btn.is_hovered = !close_btn.is_hovered;
                        console.log("mouse hovered", close_btn.is_hovered);

                    }
                    onPressed: {
                        console.log("mouse pressed");
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
                height: 100
                radius: 3
                border.color: "blue"


                Row {

                    spacing: 2

                    height: parent.height
                    width: parent.width

                    Column {

                        height: parent.height
                        width: parent.width

                        spacing: 10

                        Rectangle {
                            height: 15
                            width: parent.width

                            Text {
                                text: "time stamp"
                            }
                        }

                        Rectangle {
                            height: 20
                            width: parent.width

                            Text {

                                height: parent.height
                                width: parent.width

                                anchors.verticalCenter: parent.verticalCenter
                                text: text_content
                            }
                        }
                    }



//                    Column {
//                        height: parent.height
//                        width: 40
//                        spacing: 2

//                        Button {
//                            width: 40
//                            height: parent.height / 2 - 4
//                            text: 'A'
//                        }

//                        Button {
//                            width: 40
//                            height: parent.height / 2 - 4
//                            text: 'B'
//                        }

//                    }
                }
            }
        }
    }






}
