---
title:
date: 2021-07-13 14:39:57
update:
author: TK4E
tags:
  -

---

```sh
sqlite3 'from_this_db.db' '.dump' | sqlite3 -batch 'to_this_db.db'
    # 合并db


sqlite3 'a.db' '.dump' | sqlite3 -batch 'aa.db'
    # 合并db


sqlite3 in.db .dump > in.sql
    # .db to .sql


sqlite3 in.db < in.sql
    # .sql to .db


sqlite3 -csv anime.db ".import anime.csv table1"
    # .csv to .db


sqlite3 -separator ',' anime.db '.import new.csv "1917-2018"'
    # .csv to .db
    # 把 anime.csv 导入到 anime.db 中的表 1917-2018


sqlite3 en.db 'VACUUM;'
    # 压缩db
    # 压缩 en.db 的体积


sqlite3 -header -csv Animes.db 'select * from "1917-2018";' > animes.csv
    # .db to .csv
    # 表名放在双引号内




```sqlite
sqlite> .database
    # 查看加载了的数据库


sqlite> ATTACH DATABASE 'in.db' as 'IN';
    # 将 in.db 附加到 IN (可理解为创建副本)


sqlite> attach database 'in.db' as 'IN';
    # 上下等价(sql 不区分大小写)


sqlite> DETACH DATABASE 'IN';
    # 从数 .db 中分离 IN


sqlite> DROP TABLE TEST;
    # 删除表 TEST


sqlite> INSERT INTO COM VALUES (7, 'James', 24, 'Houston', 10000.00 );
    # 为表 COM 创建记录


sqlite> .schema
    # 查看现有的表的信息


sqlite> .tables
    # 查看现有的表


sqlite> SELECT * FROM COM;
    # 从表 COM 中获取 * (全部的)记录/内容


sqlite> SELECT A,B FROM COM;
    # 从表 COM 中获取 A,B (A和B字段) 的记录


sqlite> select 10+2;
    # 计算 10+2


sqlite> SELECT * FROM COM WHERE A > 500 OR B != 700;
    # 从表 COM 中获取 * (全部的)记录/内容
    # 然后 筛选出 A 字段下的 值大于500 的内容
    # 或者 筛选出 B 字段下的 值不是700 的内容(仅当 A > 500 不成立时才会执行这句)


sqlite> SELECT * FROM COM WHERE A IS NOT NULL;
    # 从表 COM 中获取 * (全部的)记录/内容
    # 然后 筛选出 A 字段下的 值不是NULL (不为空)的内容


sqlite> SELECT * FROM COM WHERE A GLOB 'R*';
    # 从表 COM 中获取 * (全部的)记录/内容
    # 然后 筛选出 A 字段下的 以R开头 的内容


sqlite> SELECT * FROM COM WHERE A (25, 27);
    # 从表 COM 中获取 * (全部的)记录/内容
    # 然后 筛选出 A 字段下的 值为25或27 的内容


sqlite> UPDATE anime SET 'year'='TV' WHERE year GLOB 'T*';
    # 从表 anime 中将 year字段下的所以内容改为TV
    # 但只对 year字段下以T开头值生效(这里用 WHERE 做了限制  以防止误操作)


sqlite> alter table "tableName" add "columnName" char;
    # 增加列


sqlite> alter table tableName alter column columnName varchar(4000);
    # 修改列类型


sqlite> alter table tableName drop column columnName;
    # 删除列


sqlite> ALTER TABLE Anime RENAME TO ID;
    # 修改表名名称
    # 将表名 Anime 修改为 ID


sqlite> ALTER TABLE Anime RENAME COLUMN two TO new;
    # 修改列名
    # 将表 Anime 中的列名 two 修改为 new



```
