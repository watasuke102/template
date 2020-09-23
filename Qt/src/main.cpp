#include <QtWidgets>

class MainWindow : public QMainWindow
{
    public:
        MainWindow(QWidget *parent = nullptr)
        {
        }
};

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}