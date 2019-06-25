#include "clipboard.h"
#include <QDebug>

ClipBoard::ClipBoard(QObject *parent) : QObject(parent)
{
    __clipboard = QApplication::clipboard();
    connect(__clipboard, &QClipboard::dataChanged, this, &ClipBoard::clipboardChanged);
}

void ClipBoard::clipboardChanged()
{
    qDebug() << __clipboard->text();
}
