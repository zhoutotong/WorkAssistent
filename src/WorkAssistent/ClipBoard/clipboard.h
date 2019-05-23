#ifndef CLIPBOARD_H
#define CLIPBOARD_H

#include <QObject>

class ClipBoard : public QObject
{
    Q_OBJECT
public:
    explicit ClipBoard(QObject *parent = nullptr);

signals:

public slots:
};

#endif // CLIPBOARD_H