WITH source AS (
    SELECT
        account_number,
        -- customer_number, -- DW 차원모델링에서 고객번호테이블을 별도로 분리(3NF → 2NF)
        account_status_code,
        -- account_name, -- 익명화 데이터. DW 미적재. 필요시 Business Key인 계좌번호 컬럼을 통해 조회
        -- account_password, -- 익명화 데이터. DW 미적재. 필요시 Business Key인 계좌번호 컬럼을 통해 조회
        available_balance,
        account_creation_datetime,
        account_closure_datetime,
        initial_data_creation_datetime,
        last_data_modification_datetime
    FROM {{ source("hdfs_source", "account_info") }}
)
SELECT
    *,
    current_timestamp AS stg_load_dt
FROM source
-- WHERE last_data_modification_datetime