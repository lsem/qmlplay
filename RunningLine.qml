import QtQuick 2.0

    // ------------------
    // | BANANA BANANA  |
    // ------------------
    Item {
        id: runnningLineId
        property string text: "Text Placeholder"
        property int progress: 0
        property bool debug: false

        clip: !debug

        NumberAnimation on progress {
            //running: runningLineId2.x + runningLineId2.width > runnningLineId.width
            running: true
            from: 0
            to: runnningLineId.width
            duration: 7000
            loops: Animation.Infinite
        }

        height: runningLineId1.height + 0

        Text {
            id: runningLineId1
            text: parent.text
            //x: -parent.width + parent.progress
            x: -runningLineId1.width + parent.progress

            Rectangle {
                id: runningLineLine1FrameId
                visible: runnningLineId.debug
                anchors.fill: parent
                border.width: 1
                border.color: 'blue'
                color: 'transparent'
            }
        }
        Text {
            id: runningLineId2
            text: parent.text
            x: parent.progress
            //elide: Text.ElideRight

            Rectangle {
                id: runningLineLine2FrameId
                visible: runnningLineId.debug
                anchors.fill: parent
                border.width: 1
                border.color: 'green'
                color: 'transparent'
            }
         }

        Rectangle {
            id: runningLineFrameId
            visible: runnningLineId.debug
            anchors.fill: parent
            border.width: 1
            border.color: 'red'
            color: 'transparent'
        }
    }
