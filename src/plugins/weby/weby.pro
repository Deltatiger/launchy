include(../plugins.pri)
TARGET 			= weby

QT				+= network widgets

CONFIG			+= plugin debug_and_release

VPATH			+= ../../launchy/
INCLUDEPATH		+= ../../launchy/ \
                ../../common

FORMS			= dlg.ui

HEADERS			= plugin_interface.h \
                weby.h \
                gui.h \
                globals.h \
                ../../common/DropTableWidget.h \
                IconCache.h

SOURCES			= plugin_interface.cpp \
                weby.cpp \
                gui.cpp \
                ../../common/DropTableWidget.cpp \
                IconCache.cpp

TRANSLATIONS	= \
                ../../../translations/weby_fr.ts \
                ../../../translations/weby_nl.ts \
                ../../../translations/weby_zh.ts \
                ../../../translations/weby_es.ts \
                ../../../translations/weby_de.ts \
                ../../../translations/weby_ja.ts \
                ../../../translations/weby_zh_TW.ts \
                ../../../translations/weby_rus.ts


win32 { 
    CONFIG		-= embed_manifest_dll
    LIBS		+= user32.lib shell32.lib
}

#if(!debug_and_release|build_pass):CONFIG(debug, debug|release):DESTDIR = ../../debug/plugins
#if(!debug_and_release|build_pass):CONFIG(release, debug|release):DESTDIR = ../../release/plugins

linux {
    PREFIX		= /usr
    target.path	= $$PREFIX/lib/launchy/plugins/
    icon.path	= $$PREFIX/lib/launchy/plugins/icons/
    icon.files	= weby.png
    INSTALLS	+= target icon
}

macx {
#    if(!debug_and_release|build_pass):CONFIG(debug, debug|release):DESTDIR = ../../../debug/Launchy.app/Contents/MacOS/plugins
#    if(!debug_and_release|build_pass):CONFIG(release, debug|release):DESTDIR = ../../../release/Launchy.app/Contents/MacOS/plugins

    icons.path	 = ../../../app/Launchy.app/Contents/MacOS/plugins/icons/
#    CONFIG(debug, debug|release):icons.path = ../../../debug/Launchy.app/Contents/MacOS/plugins/icons/
#    CONFIG(release, debug|release):icons.path = ../../../release/Launchy.app/Contents/MacOS/plugins/icons/

    icons.files = weby.png
    INSTALLS	+= icons
}
