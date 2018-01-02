Scripts
=======

My personnally scripts to automate boring stuffs

## Install

    $ cd ~/.local/bin
    $ git clone https://github.com/madeindjs/scripts.git
    $ chmod u+x scripts/*
    $ mv scripts/* .
    $ rm -r scripts

## Scripts

* **check_staged_php_files.sh**: Check syntax for all PHP files staged by git
* **check_staged_php_files.sh**: Check syntax for all PHP files staged by git
* **gac_search_lang.sh**: search traduction key between all application modules from Zend Framework 1
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
* **mysql_search_column.sh**: Search column between all mysql table
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
