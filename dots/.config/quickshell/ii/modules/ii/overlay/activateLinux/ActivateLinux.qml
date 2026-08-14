import QtQuick
import Quickshell
import qs.modules.common
import qs.modules.ii.overlay

StyledOverlayWidget {
    id: root
    title: Config.options.overlay.activateLinux?.title ?? "Activate Linux"
    fancyBorders: false
    showCenterButton: true
    showClickabilityButton: false
    opacity: 1
    clickthrough: true
    resizable: false

    contentItem: ActivateLinuxContent {
        anchors.centerIn: parent
    }

    function snapToCorner() {
        if (!root.parent)
            return;
        const prevAnimateX = root.animateXPos;
        const prevAnimateY = root.animateYPos;
        root.animateXPos = false;
        root.animateYPos = false;
        const targetX = Math.max(0, Math.round(root.parent.width - root.width - 40));
        const targetY = Math.max(0, Math.round(root.parent.height - root.height - 72));
        root.x = targetX;
        root.y = targetY;
        root.savePosition(targetX, targetY);
        root.animateXPos = prevAnimateX;
        root.animateYPos = prevAnimateY;
    }

    function center() {
        root.snapToCorner();
    }

    Timer {
        interval: 16
        running: (root.persistentStateEntry?.x ?? -1) < 0 || (root.persistentStateEntry?.y ?? -1) < 0
        repeat: true
        onTriggered: {
            if (!root.parent || root.parent.width <= 0 || root.parent.height <= 0)
                return;
            root.snapToCorner();
            stop();
        }
    }
}
