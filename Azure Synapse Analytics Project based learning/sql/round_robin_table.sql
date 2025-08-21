--------------------
-- Round Robin Table
--------------------
CREATE TABLE round_table_emp(
    emp_id INT,
    emp_name VARCHAR(1000),
    salary INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);


----------------
-- Insert data
----------------
INSERT INTO round_table_emp (emp_id, emp_name, salary)
VALUES (1, 'Pranoy', 56200), (2, 'Alice', 45000), (3, 'Mike', 60000);

INSERT INTO round_table_emp (emp_id, emp_name, salary)
VALUES (2, 'Alice', 45000);

INSERT INTO round_table_emp (emp_id, emp_name, salary)
VALUES (3, 'Mike', 60000);

INSERT INTO round_table_emp (emp_id, emp_name, salary)
VALUES (4, 'Harvey', 120000);

SELECT * FROM round_table_emp ORDER BY emp_id;







