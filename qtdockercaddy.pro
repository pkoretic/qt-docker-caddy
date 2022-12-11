QT = httpserver

SOURCES = main.cpp

CONFIG(debug, debug|release) {
    message("debug mode")
    DEFINES += DEBUG
} else {
    message("release mode")
}
