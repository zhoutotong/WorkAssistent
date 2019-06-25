#include "clipboardmodel.h"

#include <QSqlQuery>
#include <QSqlError>
#include <QStandardPaths>
#include <QDir>
#include <QDebug>
#include <QTableView>

static void connectToDatabase()
{
    qDebug() << __FUNCTION__ << __LINE__;
  QSqlDatabase database = QSqlDatabase::database();
  if (!database.isValid()) {
      database = QSqlDatabase::addDatabase("QSQLITE");
      if( !database.isValid())
      {
          qDebug() << "data base failed";
      }
      if (!database.isValid())
          qFatal("Cannot add database: %s", qPrintable(database.lastError().text()));
  }

  const QDir writeDir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
  if (!writeDir.mkpath("."))
      qFatal("Failed to create writable directory at %s", qPrintable(writeDir.absolutePath()));

  // Ensure that we have a writable location on all devices.
  const QString fileName = writeDir.absolutePath() + "/chat-database.sqlite3";
  qDebug() << fileName;
  // When using the SQLite driver, open() will create the SQLite database if it doesn't exist.
  database.setDatabaseName(fileName);
  if (!database.open()) {
//      qFatal("Cannot open database: %s", qPrintable(database.lastError().text()));
      QFile::remove(fileName);
      qDebug() << "can not open database";
  } else {
      qDebug() << "database open succeed";
  }
}

static void createTable()
  {
    qDebug() << __FUNCTION__ << __LINE__;
      if (QSqlDatabase::database().tables().contains("Conversations")) {
          // The table already exists; we don't need to do anything.
          qDebug() << "table is already exit";
          return;
      } else {
          qDebug() << "table is not exit";
      }

      QSqlQuery query;
      if (!query.exec(
          "CREATE TABLE IF NOT EXISTS 'Conversations' ("
          "'author' TEXT NOT NULL,"
          "'recipient' TEXT NOT NULL,"
          "'timestamp' TEXT NOT NULL,"
          "'message' TEXT NOT NULL,"
          "FOREIGN KEY('author') REFERENCES Contacts ( name ),"
          "FOREIGN KEY('recipient') REFERENCES Contacts ( name )"
          ")")) {
          qFatal("Failed to query database: %s", qPrintable(query.lastError().text()));
      } else {
          qDebug() << "table create succeed";
      }

      if(!query.exec("INSERT INTO Conversations VALUES('Me', 'Ernest Hemingway', '2016-01-07T14:36:06', 'Hello!')"))
      {
          qDebug() << "insert data to table failed";
      }
      query.exec("INSERT INTO Conversations VALUES('Ernest Hemingway', 'Me', '2016-01-07T14:36:16', 'Good afternoon.')");
      query.exec("INSERT INTO Conversations VALUES('Me', 'Albert Einstein', '2016-01-01T11:24:53', 'Hi!')");
      query.exec("INSERT INTO Conversations VALUES('Albert Einstein', 'Me', '2016-01-07T14:36:16', 'Good morning.')");
      query.exec("INSERT INTO Conversations VALUES('Hans Gude', 'Me', '2015-11-20T06:30:02', 'God morgen. Har du fått mitt maleri?')");
      query.exec("INSERT INTO Conversations VALUES('Me', 'Hans Gude', '2015-11-20T08:21:03', 'God morgen, Hans. Ja, det er veldig fint. Tusen takk! "
                 "Hvor mange timer har du brukt på den?')");
      qDebug() << __FUNCTION__ << __LINE__;
  }

ClipboardModel::ClipboardModel(QObject *parent) : QSqlTableModel(parent)
{
    connectToDatabase();
    createTable();

    this->setTable("Conversations");
    this->setEditStrategy(QSqlTableModel::OnManualSubmit);
    this->select();
    this->submitAll();

    QTableView *view = new QTableView();
    view->setModel(this);
    view->show();

    __clipboard = new ClipBoard(this);
}

ClipboardModel::~ClipboardModel()
{

}
