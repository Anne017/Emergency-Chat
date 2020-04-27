import QtQuick                   2.7;
import Ubuntu.Components         1.3;
import "databaseFunctions.js" as DatabaseFunctions;

Page {
  id          : settings_page;
  visible     : false;
  anchors.fill: parent;

  header: PageHeader {
            id   : settings_header;
            title: i18n.tr('Settings');
          }

  Column {
    spacing: units.gu(2);

    anchors {
      top    : settings_header.bottom;
      left   : parent.left;
      right  : parent.right;
      bottom : parent.bottom;
      margins: units.gu(2);
    }

    Column {
      width  : parent.width;
      spacing: units.gu(1);

      Label {
        text     : i18n.tr('Splash Screen Text Size');
        font.bold: true;
      }

      OptionSelector {
        id                    : splash_font_size;
        width                 : parent.width;
        model                 : ["Extra, Extra Small", "Extra Small",
                                 "Small",              "Medium",      "Large"];
        selectedIndex         : DatabaseFunctions.getSettingsValue("splash");
        onSelectedIndexChanged: {
          splash_text.textSize = splash_font_size.selectedIndex;

          DatabaseFunctions.updateSettingsValue("splash",
                                                splash_font_size.selectedIndex);
        }
      }
    }

    Column {
      spacing: units.gu(1);

      Label {
        text     : i18n.tr('Auto-Switch User');
        font.bold: true;
      }

      Row {
        CheckBox {
          id       : auto_switch;
          checked  : DatabaseFunctions.getSettingsValue("switch");
          onClicked: DatabaseFunctions.updateSettingsValue("switch",
                                                           auto_switch.checked ? 1 : 0);
        }

        Label {
          text: i18n.tr("    Switches the user after each message");
        }
      }
    }
  }
}