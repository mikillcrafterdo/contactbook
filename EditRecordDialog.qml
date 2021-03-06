import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import data.date 1.0

Window {
    id: dialog
    title: qsTr("Edit line")
    modality: Qt.WindowModal

    property alias firstName: firstNameInput.text
    property alias lastName: lastNameInput.text
    property alias birthday: birthdayInput.text
    property alias email: emailInput.text

    property bool edit: false
    property bool isBefore: true
    property int row: -1
    property var parentWindow: null

    signal accepted()
    signal rejected()

    function getDateMask() {
        var year = 2000
        var month = 12
        var day = 25
        var date = new Date(year, month - 1, day)
        var dateString = date.toLocaleDateString(Qt.locale(), Locale.ShortFormat)
        return dateString.replace(/\d/g, "9").replace(/[\\\/\.\:\,]/g, "\\$&") + ";_"
    }

    function resetFields() {
        firstName = ""
        lastName = ""
        birthday = ""
        email = ""
        edit = false
    }

    function open() {
        if (parentWindow) {
            x = parentWindow.x + (parentWindow.width - width) / 2
            y = parentWindow.y + (parentWindow.height - height) / 2
        }
        show()
    }

    function close() {
        hide()
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
            color: acceptableInput ? "black" : "red"
            validator: RegExpValidator { regExp: /[^\s]+/ }
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
            color: acceptableInput ? "black" : "red"
            validator: RegExpValidator { regExp: /[^\s]+/ }
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
            color: acceptableInput ? "black" : "red"
            inputMask: getDateMask()
            validator: DateValidator {}
            Button {
                anchors.right: parent.right
                height: parent.height
                width: height
                icon.source: "qrc:/images/calendar.png"
                icon.width: width
                icon.height: height
                onClicked: {
                    var date = Date.fromLocaleDateString(Qt.locale(), birthdayInput.text, Locale.ShortFormat)
                    calendar.popup(date, {x: 0, y: 0})
                }
            }
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
            inputMethodHints: Qt.ImhEmailCharactersOnly
            color: acceptableInput ? "black" : "red"
            validator: RegExpValidator { regExp: new RegExp(contactModel.emailValidator()) }
        }
        DialogButtonBox {
            Layout.column: 1
            Layout.row: 4
            Layout.columnSpan: 2
            buttonLayout: DialogButtonBox.WinLayout
            padding: 0
            Button {
                id: saveButton
                text: qsTr("Ok")
                enabled: firstNameInput.acceptableInput &&
                         lastNameInput.acceptableInput &&
                         birthdayInput.acceptableInput &&
                         emailInput.acceptableInput
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            }
            Button {
                id: loadButton
                text: qsTr("Cancel")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            onAccepted: {
                dialog.accepted()
                dialog.close()
            }
            onRejected: {
                dialog.rejected()
                dialog.close()
            }
        }
    }

    DatePicker {
        id: calendar
        onAccepted: {
            birthdayInput.text = selectedDate.toLocaleDateString(Qt.locale(), Locale.ShortFormat)
        }
    }
}
