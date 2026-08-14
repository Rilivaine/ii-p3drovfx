pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.modules.common
import "./discordVoice" as DiscordPackage

Singleton {
    id: root

    signal requestCenter(string identifier)

    readonly property var discordVoiceIcon: Component { DiscordPackage.TaskbarGlyph {} }

    readonly property var widgetSymbols: {
        "crosshair": "point_scan",
        "fpsLimiter": "animation",
        "floatingImage": "imagesmode",
        "recorder": "screen_record",
        "media": "music_note",
        "resources": "browse_activity",
        "notes": "note_stack",
        "volumeMixer": "volume_up",
        "discordVoice": "voice_chat",
        "activateLinux": "branding_watermark"
    }

    readonly property list<var> availableWidgets: {
        if (!Config?.ready) return []

        let result = []
        const configButtons = Config.options.overlay.buttons ?? []

        for (let i = 0; i < configButtons.length; i++) {
            const id = configButtons[i]
            if (widgetSymbols.hasOwnProperty(id)) {
                const entry = {
                    identifier: id,
                    materialSymbol: widgetSymbols[id]
                }
                if (id === "discordVoice") {
                    entry.iconComponent = root.discordVoiceIcon
                }
                result.push(entry)
            }
        }

        return result
    }
    readonly property bool hasPinnedWidgets: root.pinnedWidgetIdentifiers.length > 0

    property list<string> pinnedWidgetIdentifiers: []
    property list<var> clickableWidgets: []

    // Widgets only call pin() after they exist, but the overlay Loader only
    // creates them when hasPinnedWidgets is already true. Seed from saved
    // state so pinned widgets appear at session start without opening the menu.
    function syncPinnedFromPersistent() {
        if (!Persistent.ready)
            return
        const overlay = Persistent.states.overlay
        const open = overlay?.open ?? []
        let pinned = []
        for (let i = 0; i < open.length; i++) {
            const id = open[i]
            if (overlay[id]?.pinned)
                pinned.push(id)
        }
        root.pinnedWidgetIdentifiers = pinned
    }

    function pin(identifier: string, pin = true) {
        if (pin) {
            if (!root.pinnedWidgetIdentifiers.includes(identifier)) {
                root.pinnedWidgetIdentifiers = root.pinnedWidgetIdentifiers.concat([identifier])
            }
        } else {
            root.pinnedWidgetIdentifiers = root.pinnedWidgetIdentifiers.filter(id => id !== identifier)
        }
    }

    Connections {
        target: Persistent
        function onReadyChanged() {
            if (Persistent.ready)
                root.syncPinnedFromPersistent()
        }
    }

    Component.onCompleted: {
        if (Persistent.ready)
            root.syncPinnedFromPersistent()
    }

    function registerClickableWidget(widget: QtObject, clickable = true) {
        if (clickable) {
            if (!root.clickableWidgets.includes(widget)) {
                root.clickableWidgets.push(widget)
            }
        } else {
            root.clickableWidgets = root.clickableWidgets.filter(w => w !== widget)
        }
    }
}
