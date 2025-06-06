cmake_minimum_required(VERSION 3.16)

project(palktrack VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apppalktrack
    main.cpp
)

qt_add_qml_module(apppalktrack
    URI palktrack
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        SOURCES paystub.h paystub.cpp
        SOURCES workdatabase.h workdatabase.cpp
        SOURCES shift.h shift.cpp
        QML_FILES qml/DateInput.qml
        QML_FILES qml/PaystubInput.qml
        QML_FILES qml/ShiftInput.qml
        QML_FILES qml/InputScreen.qml
        SOURCES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apppalktrack PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apppalktrack
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apppalktrack
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS apppalktrack
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
