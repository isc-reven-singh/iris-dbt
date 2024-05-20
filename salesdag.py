from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.config import ProfileConfig
import os
from datetime import datetime

profile_config = ProfileConfig(
    profile_name="sales",
    target_name="iris",
    profiles_yml_filepath="/usr/local/airflow/dags/sales/profiles.yml",
)

my_cosmos_dag = DbtDag(
    project_config=ProjectConfig(
        "/usr/local/airflow/dags/sales",
    ),
    profile_config=profile_config,
    #execution_config=ExecutionConfig(
    #    dbt_executable_path=f"/home/resingh/Documents/DBT/newdemo3/newvenv-env/bin/dbt",
    #),
    # normal dag parameters
    schedule_interval="@daily",
    start_date=datetime(2023, 1, 1),
    catchup=False,
    dag_id="dbt_sales_dag",
    default_args={"retries": 2},
    operator_args={
        "install_deps": True,
    },
)