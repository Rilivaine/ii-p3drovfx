pragma Singleton

import qs.modules.common
import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Singleton {
    id: root

    property bool smartTray: Config.options.tray.filterPassive
    property list<var> itemsInUserList: SystemTray.items.values.filter(i => (isPinned(i) && (!smartTray || i.status !== Status.Passive)))
    property list<var> itemsNotInUserList: SystemTray.items.values.filter(i => (!isPinned(i) && (!smartTray || i.status !== Status.Passive)))

    property bool invertPins: Config.options.tray.invertPinnedItems
    property list<var> pinnedItems: invertPins ? itemsNotInUserList : itemsInUserList
    property list<var> unpinnedItems: invertPins ? itemsInUserList : itemsNotInUserList

    function itemLabel(item) {
        if (item.tooltipTitle.length > 0)
            return item.tooltipTitle;
        if (item.title.length > 0)
            return item.title;
        return item.id;
    }

    function uniqueId(item) {
        return item.id + "::" + itemLabel(item);
    }

    function getTooltipForItem(item) {
        var result = item.tooltipTitle.length > 0 ? item.tooltipTitle
                : (item.title.length > 0 ? item.title : item.id);
        if (item.tooltipDescription.length > 0) result += " • " + item.tooltipDescription;
        if (Config.options.tray.showItemId) result += "\n[" + uniqueId(item) + "]";
        return result;
    }

    function pin(item) {
        var uid = uniqueId(item);
        var pins = Config.options.tray.pinnedItems;
        if (pins.includes(uid)) return;
        pins.push(uid);
    }

    function unpin(item) {
        var uid = uniqueId(item);
        Config.options.tray.pinnedItems = Config.options.tray.pinnedItems.filter(id => id !== uid && id !== item.id);
    }

    function isPinned(item) {
        var pins = Config.options.tray.pinnedItems;
        var uid = uniqueId(item);
        if (pins.includes(uid))
            return true;
        return pins.includes(item.id);
    }

    function togglePin(item) {
        if (isPinned(item)) {
            unpin(item);
        } else {
            pin(item);
        }
    }

}
