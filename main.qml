import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 700
    height: 480
    visible: true
    title: qsTr("Error list demo")
    color: 'black'

    TheModel {
        id: theCriticalMessagesPanelModel
    }

    Component {
        id: rowRect
        Rectangle {
            id: rowRectRect
            width: theText.width + 30
            height: 40
            color: 'red'

            SequentialAnimation {
                loops: Animation.Infinite
                running: true

                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    target: rowRectRect
                    property: "color"
                    from: "black"
                    to: "red"
                    duration: 500
                }
                PropertyAnimation {
                    easing.type: Easing.InOutQuad
                    target: rowRectRect
                    property: "color"
                    from: "red"
                    to: "black"
                    duration: 500
                }
            }

            Text {
                id: theText
                text: message
                color: 'yellow'
                font.family: 'Fira Mono'
                font.pointSize: 14
                font.bold: true
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
/* 		hoverEnabled: true */
/* 		onEntered: { */
/* 		    console.log(index + ' entered, text width is: ' + parent.width) */
/* 		    // TODO: do not reference list directly. Find better way. */
/* 		    var item_right = parent.x + parent.width */
/* 		    var list_right = theCriticalMessagesPanelListView.x + theCriticalMessagesPanelListView.width */
/* 		    if (item_right >= list_right) { */
/* 			console.log('Does not fit!') */
/* //			parent.z = theCriticalMessagesPanelListView.z + 1 */
/* 			theCriticalMessagesPanelListView.clip = false */
/* 		    } */
/* 		    // How am I supposed to find a delegate corresponding to index? */
		    
/* 		} */
/* 		onExited: { */
/*     		    console.log(index + ' exited') */
/* 		    theCriticalMessagesPanelListView.clip = true */
/* 		} */
                onClicked: {	/**/


                    /*console.log('Clicked!: '
                                    + Object.keys(theCriticalMessagesPanelModel)
                                    + ', index: ' + index)*/
                    theCriticalMessagesPanelModel.remove(index)
                }
            }
        }
    }

    Rectangle {
        id: theCriticalMessagesPanelListViewRect
        width: 500
        height: 250
        x: 100
        y: 100
        color: 'gray'

        ListView {
            id: theCriticalMessagesPanelListView
            model: theCriticalMessagesPanelModel
            spacing: 6
            delegate: rowRect
            clip: true
            anchors.fill: parent
            anchors.margins: 15

	    MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		onEntered: {
		    parent.clip = false
		}
		onExited: {
		    parent.clip = true
		}
	    }
	    
        }
    }

    Rectangle {
        id: rect
        width: 100
        height: 50
        x: (theCriticalMessagesPanelListViewRect.x + theCriticalMessagesPanelListViewRect.width) / 2
        y: theCriticalMessagesPanelListViewRect.y + theCriticalMessagesPanelListViewRect.height + 30

        color: 'gray'

        Text {
            anchors.centerIn: parent
            text: "ADD"
            color: 'white'
        }

        TapHandler {
            onPressedChanged: {
                var random_words = ["corpse", "sandwitch", "strain", "conference", "page", "finished", "concerete"]
                var random_phrase = []
                for (var i = 0; i < Math.floor(Math.random() * 10 + 1); ++i) {
                    var random_index = Math.floor(Math.random(
                                                      ) * random_words.length)
                    random_phrase.push(random_words[random_index])
                }
                if (pressed)
                    theCriticalMessagesPanelModel.append({
                                                             "message": 'WARNING: ' + random_phrase
                                                         })
            }
        }
    }
}
