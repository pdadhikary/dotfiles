import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: splash
    color: "#000000"
    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        Rectangle {
            id: imageSource
            width: parent.width
            height: parent.height
            color: "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            clip: true

            AnimatedImage {
                id: welcome_to_the_wastes
                source: "images/windrunner-splash.gif"
                paused: false
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                smooth: true
                visible: true
            }
        }

    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 100
        easing.type: Easing.InOutQuad
    }
}
