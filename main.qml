import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Make transition")

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "RightState"

        Rectangle {
            id: leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                id: move
                anchors.centerIn: parent
                text: "move"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "LeftState"
            }
        }
        Rectangle {
            id: rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            Text {
                id: retur
                anchors.centerIn: parent
                text: "return"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "RightState"
            }
        }

        Rectangle {
            id:ball
            color: "darkgreen"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }
        states: [
            State {
                name: "RightState"
                PropertyChanges {
                    target: ball
                    x: rightRectangle.x + 5
                }
            },
            State {
                name: "LeftState"
                PropertyChanges {
                    target: ball
                    x: ball.x += 30
                }
            }
        ]

        transitions: [
            Transition {
            from: "LeftState"
            to: "RightState"
            NumberAnimation {
                properties: "x,y"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        },
            Transition {
            from: "RightState"
            to: "LeftState"
        }
        ]

    }
}
