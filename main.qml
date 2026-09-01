import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    minimumWidth: 400
    minimumHeight: 400
    title: qsTr("CRUD Application")

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // Title
        Label {
            id: headingTRext
            text: qsTr("Employee Database")
            font.pixelSize: 28
            font.bold: true

            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }

        // Search area

        RowLayout {
            spacing: 10

            TextField {
                id: searchField
                width: 300
                placeholderText: "Search employee ..."
                Layout.fillWidth: true
            }

            Button {
                text: "Search"

                Layout.preferredWidth: 120

                onClicked: {
                    console.log("Search:", searchField.text)
                }
            }
        }

        // CRUD Buttons
        RowLayout {
            spacing: 10

            Button {
                text: "Add"

                Layout.fillWidth: true
                onClicked: {
                    console.log("Add Clicked")
                }
            }

            Button {
                text: "Edit"

                Layout.fillWidth: true
                onClicked: {
                    console.log("Edit Clicked")
                }
            }

            Button {
                text: "Delete"

                Layout.fillWidth: true
                onClicked: {
                    console.log("Delete Clicked")
                }
            }
        }

        RowLayout {

            Rectangle
            {
                Layout.fillWidth: true
                Layout.fillHeight: true

                ListView {
                    id: listView
                    anchors.fill: parent
                    model: ["Qt","C++","Sqlite","Linux"]

                    delegate: Rectangle
                    {
                        border.width: 1
                        border.color: "gray"
                        height: 50
                        width: parent.width
                        color: ListView.isCurrentItem ? "yellow" : "white"

                        Text {
                            text: modelData
                            anchors.centerIn: parent
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: listView.currentIndex = index
                        }
                    }
                }

            }

        }

    }
}
