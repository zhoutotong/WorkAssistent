#ifndef CLIPBOARD_H
#define CLIPBOARD_H

#include <QObject>
#include <QClipboard>
#include <QApplication>

class ClipBoard : public QObject
{
    Q_OBJECT
public:
    explicit ClipBoard(QObject *parent = nullptr);

private:
    QClipboard *__clipboard;

signals:

public slots:
    void clipboardChanged();
};

#endif // CLIPBOARD_H
