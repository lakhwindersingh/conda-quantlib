# run your first task instance
airflow run example_bash_operator runme_0 2018-01-01
# run a backfill over 2 days
airflow backfill example_bash_operator -s 2018-01-01 -e 2018-01-02