import qs.modules.common
import qs.modules.common.models.quickToggles
import qs.modules.common.widgets
import qs.services

QuickToggleButton {
    id: root

    VrrToggle {
        id: vrrModel
    }

    toggled: vrrModel.toggled
    buttonIcon: vrrModel.icon
    onClicked: vrrModel.mainAction()

    StyledToolTip {
        text: vrrModel.tooltipText
    }
}
