#ifndef SQLDATAHANDLER_H
#define SQLDATAHANDLER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlTableModel>

#include <QDebug>

#include <QVariantList>
#include <QVariantMap>

class SqlDataHandler : public QObject
{
    Q_OBJECT
public:
    explicit SqlDataHandler(QObject *parent = nullptr);

    Q_INVOKABLE QVariantList getSqlTable();

signals:

private:
    QSqlDatabase db;

};

#endif // SQLDATAHANDLER_H
