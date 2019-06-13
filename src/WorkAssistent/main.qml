import QtQuick 2.9
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4

//import "ClipBoardComponent.qml"

import ClipBoard 1.0

Window {

    id: root
    visible: true
    width: 308
    minimumHeight: 688
    flags: "FramelessWindowHint"
    color: "#00000000"

    Rectangle {
        width: parent.width
        height: parent.height
        border.color: "gray"
        border.width: 1
        radius: 10
        Page {
            width: parent.width - 8
            height: parent.height - 8
            anchors.centerIn: parent

            title: "WorkAssistent"
            // header view
            header: Rectangle {

                id: head
                width: parent.width
                height: 30
                radius: 20
                color: "#00000000"

                Rectangle {
                    id: close_btn
                    anchors.right: parent.right
                    width: 30
                    height: 30
                    color: is_hovered ? "#FF3030" : "#FFFFF0"
                    radius: 5
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
                        }
                        onHoveredChanged: {
                            close_btn.is_hovered = !close_btn.is_hovered;
                        }
                    }
                }

                Rectangle {
                    id: setting_btn
                    anchors.right: close_btn.left
                    width: 30
                    height: 30
                    color: is_hovered ? "#FF3030" : "#FFFFF0"
                    radius: 5
                    property bool is_hovered: false
                    Image {
                        id: setting_btn_img
                        width: 30
                        height: 30

                        anchors.right: parent.right
                        source: "qrc:/img/settings_btn.png"
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {

                        }
                        onHoveredChanged: {
                            setting_btn.is_hovered = !setting_btn.is_hovered;
                        }
                    }
                }

                Row {
                    width: parent.width - close_btn.width - setting_btn.width
                    height: parent.height

                    Rectangle {
                        anchors.fill: parent
                        Text {
                            text: "WorkAssistent"
                            font.family: "Helvetica"
                            font.pointSize: 12
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 100
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
                id: testModel
                  ListElement {
                      name: "Bill Smith"
                      number: "555 3264"
                  }
                  ListElement {
                      name: "John Brown"
                      number: "555 8426"
                  }
                  ListElement {
                      name: "Sam Wise"
                      number: "555 0473"
                  }
              }
            ListView{
                width: parent.width;
                height: parent.height

                spacing: 2
                model: testModel

                clip: true
                delegate: Rectangle {

                    width: parent.width
                    height: 50
                    radius: 10
                    border.width: 1
                    border.color: "blue"

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: name + ": " + number
                    }
                }
            }

            // footer view
            footer: TabBar {
                width: parent.width

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


}
