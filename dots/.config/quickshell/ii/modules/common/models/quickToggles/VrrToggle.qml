import QtQuick
import qs.modules.common
import qs.modules.common.models.hyprland
import qs.services

QuickToggleModel {
    id: root
    name: Translation.tr("VRR")
    icon: "autofps_select"
    toggled: root.vrr > 0
    statusText: root.vrr > 0 ? Translation.tr("On") : Translation.tr("Off")
    tooltipText: Translation.tr("Variable refresh rate")

    readonly property int vrr: Number(confOpt.value ?? 0)
    property int lastEnabledMode: 2

    onVrrChanged: {
        if (root.vrr > 0)
            root.lastEnabledMode = root.vrr;
    }

    mainAction: () => {
        if (root.vrr > 0) {
            root.lastEnabledMode = root.vrr;
            confOpt.value = 0;
            HyprlandConfig.set("misc:vrr", 0);
            return;
        }

        confOpt.value = root.lastEnabledMode;
        HyprlandConfig.reset("misc:vrr");
    }

    HyprlandConfigOption {
        id: confOpt
        key: "misc:vrr"
    }
}
