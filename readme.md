Scripts
=======

![Is It Worth the Time?](https://imgs.xkcd.com/comics/is_it_worth_the_time.png)

My personnally scripts to automate boring stuffs

## Install

    $ cd ~/.local/bin
    $ git clone https://github.com/madeindjs/scripts.git
    $ chmod u+x scripts/*
    $ mv scripts/* .
    $ rm -r scripts

## Scripts

* *check_staged_php_files.sh*: Check syntax for all PHP files staged by git
* PHP / Zend Framework 1
    * *zf1_search_lang.sh*: search all translations for the given key / value
    * *zf1_current_database.sh*: find current database connected to application
* **MySQL**
    * **mysql_desc.sh**: Search & describe given table
~~~
    $ mysql_desc.sh use%
    +----------------+--------------+------+-----+---------+-------+
    | Field          | Type         | Null | Key | Default | Extra |
    +----------------+--------------+------+-----+---------+-------+
    | GRANTEE        | varchar(81)  | NO   |     |         |       |
    | TABLE_CATALOG  | varchar(512) | NO   |     |         |       |
    | PRIVILEGE_TYPE | varchar(64)  | NO   |     |         |       |
    | IS_GRANTABLE   | varchar(3)   | NO   |     |         |       |
    +----------------+--------------+------+-----+---------+-------+
    Describe information_schema.USER_PRIVILEGES
~~~
    * *mysql_search_column.sh*: Search column between all mysql table
~~~
    $ mysql_search_column.sh user_id
    +--------------------------+-------------+
    | TABLE_NAME               | COLUMN_NAME |
    +--------------------------+-------------+
    | dishes                   | user_id     |
    | mailings                 | user_id     |
    | menus                    | user_id     |
    | opening_hours            | user_id     |
~~~
  * *mysql_run_files_on_databases.sh*: Run given SQL on migration on all databases corresponding to a specific patern
* **SSH**
  * *ssh_dev.sh*: Connect on server on given directory (or directory corresponding to my local branch)