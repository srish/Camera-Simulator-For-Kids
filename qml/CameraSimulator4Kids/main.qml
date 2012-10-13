// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
    width: 800
    height: 600
    border.width: 50
    border.color: "gray"

    Rectangle {
        anchors.fill: parent
        anchors.margins: 15
        radius: 10
        color: "#dfdfdf"


        GridView {
            id: gridView
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10
            width: 250
            height: 400
            cellHeight: 110
            cellWidth: 120
            model: listModel

            delegate:
                Rectangle {
                    id: imageBox
                    width: 90
                    height: 85
                    radius: 10
                    color: "gray"

                Image {
                    width: 80
                    height: 80
                    anchors.centerIn: imageBox
                    source: imageSource
                    smooth: true
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        anchors.fill: parent
                        onClicked: previewPicture.source = imageSource
                    }
                }
            }
        }

        Rectangle {
            border.width: 15
            radius: 10
            border.color: "gray"
            anchors.left: gridView.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 15
            anchors.rightMargin:  15
            anchors.leftMargin: 10
            height: parent.height * 2 /3 - 10

            Image {
                id:  previewPicture
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                source: "qrc:///Images/Image1.jpg"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    ListModel {
        id: listModel
    }

    Component.onCompleted: {
        for(var i = 1; i<= 8; i++)
        {
            listModel.append({imageSource: "qrc:///Images/Image" + i + ".jpg"});
        }
    }
}
