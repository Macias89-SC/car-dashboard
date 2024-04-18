import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 6.4
import Quick3DAssets.Supra
import Quick3DAssets.Road_Bend
import QtQuick.Timeline 1.0

Item {    
    id: car3DClass
    property bool switchDoorRight: false
    property bool switchDoorLeft: false
    property bool switchDoorTrunk: false

    View3D {
        id: view3D
        anchors.fill: parent
        environment: sceneEnvironment

        SceneEnvironment {
            id: sceneEnvironment
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
            id: scene

            DirectionalLight {
                id: directionalLight
                x: -388.973
                y: 111.084
                brightness: 1.7
                eulerRotation.z: -0
                eulerRotation.y: 0
                eulerRotation.x: -19.561
                z: 310.28943
            }

            PerspectiveCamera {
                id: sceneCamera
                x: 5.163
                y: 76.679
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -12.1467
                z: 336.44199
            }

            Supra {
                id: car3Dmodel
                x: 11.504
                y: -90.867
                eulerRotation.z: -0.00001
                eulerRotation.y: 320
                eulerRotation.x: -0
                z: -54.98334
                scale: Qt.vector3d(80, 80, 80)
            }
        }

        Model {
            id: road
            x: 7.172
            y: -95.309
            source: "#Cube"
            z: -5820.31836
            opacity: 0
            scale: Qt.vector3d(9.5, 0.01, 120)
            materials: PrincipledMaterial {
                baseColor: "black"
            }
        }

        Model {
            id: leftline
            x: -430.172
            y: -90.867
            source: "#Cube"
            z: -5820.31836
            opacity: 0
            scale: Qt.vector3d(0.08, 0.01, 120)
            materials: PrincipledMaterial {
                baseColor: "white"
            }
        }

        Model {
            id: rightline
            x: 450.172
            y: -90.867
            source: "#Cube"
            z: -5820.31836
            opacity: 0
            scale: Qt.vector3d(0.08, 0.01, 120)
            materials: PrincipledMaterial {
                baseColor: "white"
            }
        }

        Road_Bend  {
            id: midlleline1
            opacity: 0
            x: -39.828
            y: -90.865
            eulerRotation.z: 0
            eulerRotation.x: -0.00001
            scale.z: 100
            z: 167.32294
            scale.x: 80
            eulerRotation.y: -270
            mat: lanelineMaterial
        }

        Road_Bend  {
            id: midlleline2
            opacity: 0
            x: -349.9
            y: -90.865
            eulerRotation.z: 0
            eulerRotation.x: -0.00001
            scale.z: 100
            z: 167.32301
            scale.x: 80
            eulerRotation.y: -270
            mat: lanelineMaterial
        }

        NumberAnimation {
            id: trunkAnim
            target: car3Dmodel
            property: "trunkAngle"   //look in folder asset_imports/Quick3DAssets/Supra/Supra.qml
            from: 0
            to: 50
            duration: 600
        }

        NumberAnimation {
            id: leftDoorAnim
            target: car3Dmodel
            property: "leftDoorAngle"   //look in folder asset_imports/Quick3DAssets/Supra/Supra.qml
            from: 0
            to: -50
            duration: 600
        }



        NumberAnimation {
            id: rightDoorAnim
            target: car3Dmodel
            property: "rightDoorAngle"  //look in folder asset_imports/Quick3DAssets/Supra/Supra.qml
            from: 0
            to: 50
            duration: 600
        }
    }

    NumberAnimation {
        id:linesAnimation
        target:lanelines;
        property: "positionV"
        from: 0
        to: 1
        duration: 1000
        loops: -1
    }

    Button {
        id:switchLefttdoor
        text:"Left Door"
        x: 200
        y: 100
        onClicked: {
            car3DClass.state = "leftdoorChange"
            leftDoorAnim.running = true
            if(switchDoorLeft == false) {
                leftDoorAnim.from = -50
                leftDoorAnim.to = 0
                switchDoorLeft = true

            } else if (switchDoorLeft == true) {
                leftDoorAnim.from = 0
                leftDoorAnim.to = -50
                switchDoorLeft = false
                if(switchDoorRight == false && switchDoorTrunk == false && switchDoorLeft == false) {
                    car3DClass.state = "Home"
                }
            }
        }
    }

    Button {
        id:switchTrunk
        text:"Trunk"
        x: 400
        y: 100
        onClicked: {
            car3DClass.state = "trunkChange"
            trunkAnim.running = true
            if(switchDoorTrunk == true) {
                trunkAnim.from = 0
                trunkAnim.to = 50
                switchDoorTrunk = false
                if(switchDoorRight == false && switchDoorTrunk == false && switchDoorLeft == false) {
                    car3DClass.state = "Home"
                }

            } else if (switchDoorTrunk == false) {
                trunkAnim.from = 50
                trunkAnim.to = 0
                switchDoorTrunk = true
            }
        }
    }

    Button {
        id:switchRightdoor
        text:"Right Door"
        x: 600
        y: 100
        onClicked: {
            car3DClass.state = "rightdoorChange"
            rightDoorAnim.running = true
            if(switchDoorRight == true) {
                rightDoorAnim.from = 0
                rightDoorAnim.to = 50
                switchDoorRight = false
                if(switchDoorRight == false && switchDoorTrunk == false && switchDoorLeft == false) {
                    car3DClass.state = "Home"
                }

            } else if (switchDoorRight == false) {
                rightDoorAnim.from = 50
                rightDoorAnim.to = 0
                switchDoorRight = true
            }
        }
    }

    Switch {
        enabled: false
        id: switchLeft
        x: 200
        y: 54
        width: 120
        height: 40
        text: "LeftDoor"
        checked: switchDoorLeft
    }

    Switch {
        enabled: false
        id: switchRight
        x: 600
        y: 54
        text: "RightDoor"
        checked: switchDoorRight
    }

    Switch {
        enabled: false
        id: switcheTrunk
        x: 400
        y: 54
        text: "Trunk"
        checked: switchDoorTrunk
    }

    Button{
        id:switchDrive
        text:"Drive"
        x: 400
        y: 470
        onClicked: {
            car3DClass.state = "Straight"
        }
    }

    Item {
        id: __materialLibrary__
        DefaultMaterial {
            id: lanelineMaterial
            diffuseColor: "#ffffff"
            diffuseMap: lanelines
            Texture {
                id: lanelines
                source: "images/lanelines.png"
                tilingModeHorizontal: Texture.Repeat
                tilingModeVertical: Texture.Repeat
            }
            objectName: "lanelineMaterial"
            depthDrawMode: Material.NeverDepthDraw
        }

    }

    Keys.onLeftPressed: car3DClass.state = "Left"
    Keys.onRightPressed: car3DClass.state = "Right"
    Keys.onUpPressed: car3DClass.state = "Straight"

    states: [

        State {
            name: "Home"

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 320
            }
        },

        State {
            name: "leftdoorChange"

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 240
            }
        },

        State {
            name: "rightdoorChange"

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 120
            }
        },

        State {
            name: "trunkChange"

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 180
            }

        },

        State {
            name: "Straight"

            PropertyChanges {
                target: sceneCamera
                x: 5.163
                y: 313.123
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -5.69537
                z: 1010.30231
            }

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 180
            }

            PropertyChanges {
                target: leftline
                opacity: 0.8

            }

            PropertyChanges {
                target: midlleline1
                opacity: 0.8
            }

            PropertyChanges {
                target: midlleline2
                opacity: 0.8

            }

            PropertyChanges {
                target: rightline
                opacity: 0.8
            }

            PropertyChanges {
                target: road
                opacity: 1
            }

            PropertyChanges {
                target: linesAnimation
                running: true
            }
        },

        State {
            name: "Left"

            PropertyChanges {
                target: sceneCamera
                x: 5.163
                y: 313.123
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -5.69537
                z: 1010.30231
            }

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 180
                x:-250
            }

            PropertyChanges {
                target: leftline
                opacity: 0.8

            }

            PropertyChanges {
                target: midlleline1
                opacity: 0.8

            }

            PropertyChanges {
                target: midlleline2
                opacity: 0.8

            }

            PropertyChanges {
                target: rightline
                opacity: 0.8

            }

            PropertyChanges {
                target: road
                opacity: 1
            }

            PropertyChanges {
                target: linesAnimation
                running: true
            }
        },

        State {
            name: "Right"

            PropertyChanges {
                target: sceneCamera
                x: 5.163
                y: 313.123
                eulerRotation.z: 0
                eulerRotation.y: -0
                eulerRotation.x: -5.69537
                z: 1010.30231
            }

            PropertyChanges {
                target: car3Dmodel
                eulerRotation.y: 180
                x: 270
            }

            PropertyChanges {
                target: leftline
                opacity: 0.8

            }

            PropertyChanges {
                target: midlleline1
                opacity: 0.8

            }

            PropertyChanges {
                target: midlleline2
                opacity: 0.8

            }

            PropertyChanges {
                target: rightline
                opacity: 0.8

            }

            PropertyChanges {
                target: road
                opacity: 1
            }

            PropertyChanges {
                target: linesAnimation
                running: true
            }
        }
    ]

    transitions:[

        Transition {
            NumberAnimation {
                properties: "eulerRotation.y, x, y, z,  eulerRotation.z, eulerRotation.x, opacity"
                duration: 1000
            }
        }
    ]
}
