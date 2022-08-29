#include <QApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickView>
#include <QQmlContext>



int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQuickView view;
    QQmlContext *context = view.engine() ->rootContext();
    context->setContextProperty("_aString", QString("KDA"));
    context->setContextProperty("_background", QColor(Qt::lightGray));

    view.setSource(QUrl("qrc:main.qml"));
//    view.show();

//    QQmlApplicationEngine engine;
//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

    return app.exec();
}
