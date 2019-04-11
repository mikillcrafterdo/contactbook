import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.12

Dialog {
    title: qsTr("Edit line")

    property alias firstName: firstNameInput.text
    property alias lastName: lastNameInput.text
    property alias birthday: birthdayInput.text
    property alias email: emailInput.text

    property var model: null

    function resetFields() {
        firstName = ""
        lastName = ""
        birthday = ""
        email = ""
        model = null
    }

    GridLayout {
        anchors.fill: parent

        Label {
            Layout.column: 0
            Layout.row: 0
            text: qsTr("First name")
        }
        TextField {
            Layout.column: 1
            Layout.row: 0
            id: firstNameInput
            selectByMouse: true
        }

        Label {
            Layout.column: 0
            Layout.row: 1
            text: qsTr("Last name")
        }
        TextField {
            Layout.column: 1
            Layout.row: 1
            id: lastNameInput
            selectByMouse: true
        }

        Label {
            Layout.column: 0
            Layout.row: 2
            text: qsTr("Birthday")
        }
        TextField {
            Layout.column: 1
            Layout.row: 2
            id: birthdayInput
            selectByMouse: true
            inputMethodHints: Qt.ImhDate
        }

        Label {
            Layout.column: 0
            Layout.row: 3
            text: qsTr("Email")
        }
        TextField {
            Layout.column: 1
            Layout.row: 3
            id: emailInput
            selectByMouse: true
        }
    }

    standardButtons: StandardButton.Ok | StandardButton.Cancel
}
