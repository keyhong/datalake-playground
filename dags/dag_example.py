"""
Example DAG demonstrating the usage of the BashOperator.
"""

from __future__ import annotations

from datetime import timedelta
from pathlib import Path

import pendulum
from airflow.decorators import dag
from airflow.operators.bash import BashOperator
from config.dag_default_config import build_default_args

dag_args = build_default_args()

@dag(
    dag_id=Path(__file__).stem,
    description=__doc__[0: __doc__.find(".")],
    doc_md=__doc__,
    default_args=dag_args,
    start_date=pendulum.datetime(2024, 5, 6, tz="Asia/Seoul"),
    schedule="5 0 * * *",
    catchup=False,
    dagrun_timeout=timedelta(minutes=60),
    tags=["dbt"],
)
def generate_dag() -> None:

    # [START howto_operator_bash]
    run_this_1 = BashOperator(
        task_id="run_after_loop",
        bash_command="echo 1",
    )

    run_this_2 = BashOperator(
        task_id="run_after_loop",
        bash_command="echo 1",
    )    

    run_this_1 >> run_this_2

generate_dag()

if __name__ == "__main__":
    dag.test()