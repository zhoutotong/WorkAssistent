#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include <QDateTime>
#include <QDebug>

#include <QApplication>

#include "ClipBoard/clipboard.h"
#include "ClipBoard/clipboardmodel.h"


int main(int argc, char *argv[])
{
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    qmlRegisterType<ClipBoard>("ClipBoard", 1, 0, "ClipBoard");
    ClipboardModel *clipBoartModel = new ClipboardModel();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

