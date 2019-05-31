import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick.Controls 2.4

//import "ClipBoardComponent.qml"

import ClipBoard 1.0

Window {

    id: root

    visible: true
    width: 300
    minimumHeight: 680
    flags: "FramelessWindowHint"

    Page {
        anchors.fill: parent

        // header view
        header: Rectangle {

            id: head
            width: parent.width
            height: 30

            Rectangle {
                id: close_btn
                anchors.right: parent.right
                width: 30
                height: 30
                color: is_hovered ? "#008B8B" : "#FFFFF0"
                property bool is_hovered: false
                Image {
                    id: close_btn_img
                    width: 30
                    height: 30

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

            Row {
                width: parent.width - close_btn.width
                height: parent.height

                Rectangle {
                    anchors.fill: parent
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
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


        // footer view
        footer: TabBar {
            width: parent.width
            height: 35
            TabButton {
              text: qsTr("ClipBoard")
            }
            TabButton {
              text: qsTr("History")
            }
            TabButton {
              text: qsTr("Others")
            }
        }
    }

}
