#ifndef CLIPBOARDMODEL_H
#define CLIPBOARDMODEL_H

#include <QObject>
#include <QtSql/QSqlTableModel>
#include "clipboard.h"

class ClipboardModel : public QSqlTableModel
{
    Q_OBJECT
public:
    explicit ClipboardModel(QObject *parent = nullptr);
    ~ClipboardModel();

private:
    ClipBoard *__clipboard;
signals:

public slots:
};

#endif // ClipboardModel_H
