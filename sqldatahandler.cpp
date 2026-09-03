#include "sqldatahandler.h"

SqlDataHandler::SqlDataHandler(QObject *parent) : QObject(parent)
{
    db = QSqlDatabase::addDatabase("QSQLITE");

    db.setDatabaseName("learnerDB.sqlite");

    if(!db.open())
    {
        qDebug() << "Database failed:"
                 << db.lastError().text();
        return;
    }

    QSqlQuery query(db);

    if(!query.exec("CREATE TABLE IF NOT EXISTS Employee "
               "(employee TEXT, id INTEGER PRIMARY KEY, age INTEGER)"))
    {
        qDebug()<<"Failed: "<<query.lastError().text();
    }

//    if(!query.exec("INSERT INTO Employee (employee,id,age) VALUES"
//               "('Zubair',323,25)"))
//    {
//        qDebug()<<"Failed: "<<query.lastError().text();
//    }

}

QVariantList SqlDataHandler::getSqlTable()
{
    QVariantList employeeList;

    QSqlQuery query(db);

    if(!query.exec("SELECT employee,id,age FROM Employee"))
    {
        qDebug() << "Failed:" << query.lastError().text();
                return employeeList;
    }

    while(query.next())
    {
        QVariantMap employee;

        employee["employee"] = query.value("employee");
        employee["id"] = query.value("id");
        employee["age"] = query.value("age");

        employeeList.append(employee);
    }

    return employeeList;
}
