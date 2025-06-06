#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "workdatabase.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    WorkDatabase work_db = WorkDatabase();

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("palktrack", "Main");

    return app.exec();
}
