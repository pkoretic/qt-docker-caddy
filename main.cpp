#include <QtCore>
#include <QtHttpServer>

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QHttpServer httpServer;

    const auto port = httpServer.listen(QHostAddress::Any, 8282);

    if (!port)
        return 0;

    httpServer.route("/", []() {
        return "Hello world from Qt!";
    });


    qDebug() << QCoreApplication::translate("qtdockercaddy",
            "Running on http://127.0.0.1:%1/").arg(port);
    return app.exec(); 
}
