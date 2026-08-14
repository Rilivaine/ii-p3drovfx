import QtQuick
import qs
import qs.modules.common

Item {
    id: root

    readonly property var cfg: Config.options.overlay.activateLinux
    readonly property real textOpacity: {
        const opacityValue = cfg?.textOpacity ?? 0.4;
        return GlobalStates.overlayOpen ? Math.max(0.72, opacityValue) : opacityValue;
    }
    readonly property color watermarkColor: Qt.rgba(1, 1, 1, root.textOpacity)

    implicitWidth: textCol.implicitWidth
    implicitHeight: textCol.implicitHeight

    Column {
        id: textCol
        spacing: 1

        Text {
            text: root.cfg?.title ?? "Activate Linux"
            color: root.watermarkColor
            font.family: Appearance.font.family.main
            font.pixelSize: root.cfg?.titleSize ?? 22
            font.weight: Font.Light
        }

        Text {
            text: root.cfg?.subtitle ?? "Go to Settings to activate Linux."
            color: root.watermarkColor
            font.family: Appearance.font.family.main
            font.pixelSize: root.cfg?.subtitleSize ?? 14
            font.weight: Font.Normal
        }
    }
}
