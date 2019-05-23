#ifndef CLIPBOARDMODEL_H
#define CLIPBOARDMODEL_H

#include <QObject>
#include <QtSql/QSqlTableModel>

class ClipBoardModel : public QSqlTableModel
{
    Q_OBJECT
public:
    explicit ClipBoardModel(QObject *parent = nullptr);

signals:

public slots:
};

#endif // CLIPBOARDMODEL_H
