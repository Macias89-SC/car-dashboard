

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: engine_temperature
    width: 375
    height: 100
    property int currentEngineTemperature: 0
    x: 17
    y: 5

    Image {
        id: dotsLines
        x: 3
        y: 3
        width: 370
        height: 95
        visible: true
        source: "FuelLevel_EngineTemp/liniaPrzerywana.svg"
        scale: 1
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: levelActive_1
        x: -24
        y: -3
        width: 110
        height: 79
        visible: true
        source: "FuelLevel_EngineTemp/linia1.svg"
        rotation: -3
        scale: 0.48
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: levelActive_2
        x: 32
        y: 24
        width: 119
        height: 79
        visible: true
        source: "FuelLevel_EngineTemp/linia2.svg"
        rotation: -3
        scale: 0.48
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: levelActive_3
        x: 88
        y: 61
        width: 135
        height: 33
        visible: true
        source: "FuelLevel_EngineTemp/linia3.svg"
        rotation: -1
        scale: 0.48
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: levelActive_4
        x: 148
        y: 58
        width: 150
        height: 39
        visible: true
        source: "FuelLevel_EngineTemp/linia4.svg"
        rotation: 4
        scale: 0.48
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: levelActive_5
        x: 219
        y: 30
        width: 135
        height: 65
        visible: true
        source: "FuelLevel_EngineTemp/linia5.svg"
        rotation: 5.43
        scale: 0.48
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: levelActive_6
        x: 286
        y: -11
        width: 119
        height: 90
        visible: true
        source: "FuelLevel_EngineTemp/linia6_red.svg"
        rotation: 6
        scale: 0.48
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: tempEngine_50
        x: 4
        y: -7
        visible: true
        color: "#ffffff"
        text: qsTr("50")
        font.pixelSize: 20
        font.family: "Verdana"
        font.bold: true
    }

    Text {
        id: tempEngine_90
        x: 176
        y: 49
        width: 32
        height: 28
        visible: true
        color: "#ffffff"
        text: qsTr("90")
        font.pixelSize: 20
        font.family: "Verdana"
        font.bold: true
    }

    Text {
        id: tempEngine_130
        x: 325
        y: -7
        visible: true
        color: "#ffffff"
        text: qsTr("130")
        font.pixelSize: 20
        font.family: "Verdana"
        font.bold: true
    }

    Image {
        id: engineTemp_NotActive
        x: 163
        y: 2
        source: "Icons/GaugesIcons/EngineTemp_NotActive.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: engineTemp_active
        x: 163
        y: 2
        source: "Icons/GaugesIcons/EngineTemp_active.svg"
        fillMode: Image.PreserveAspectFit
    }

    Item {
        id: __materialLibrary__
    }

    states: [
        State {
            name: "Level0"
            when: engine_temperature.currentEngineTemperature === 0

            PropertyChanges {
                target: levelActive_1
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 1
            }
        },

        State {
            name: "Level1"
            when: engine_temperature.currentEngineTemperature === 1

            PropertyChanges {
                target: levelActive_1
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 1
            }
        },

        State {
            name: "Level2"
            when: engine_temperature.currentEngineTemperature === 2

            PropertyChanges {
                target: levelActive_1
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 1
            }
        },
        State {
            name: "Level3"
            when: engine_temperature.currentEngineTemperature === 3

            PropertyChanges {
                target: levelActive_1
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 1
            }
        },
        State {
            name: "Level4"
            when: engine_temperature.currentEngineTemperature === 4

            PropertyChanges {
                target: levelActive_1
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 0
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 1
            }
        },
        State {
            name: "Level5"
            when: engine_temperature.currentEngineTemperature === 5

            PropertyChanges {
                target: levelActive_1
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 0
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 1
            }
        },
        State {
            name: "Level6"
            when: engine_temperature.currentEngineTemperature === 6

            PropertyChanges {
                target: levelActive_1
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_2
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_3
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_4
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_5
                opacity: 1
            }
            PropertyChanges {
                target: levelActive_6
                opacity: 1
            }
            PropertyChanges {
                target: engineTemp_active
                opacity: 1
            }
            PropertyChanges {
                target: engineTemp_NotActive
                opacity: 0
            }
        }
    ]
}
