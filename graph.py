#!/usr/bin/python3

import sqlite3

import pandas as pd

import matplotlib.pyplot as plt


conn = sqlite3.connect('./shiptivity.db')


query = """
SELECT DATE(datetime(login_timestamp, 'unixepoch')) AS login_date, COUNT(DISTINCT user_id) AS daily_users
FROM  login_history
WHERE datetime(login_timestamp, 'unixepoch') < '2024-09-04'
GROUP BY login_date
ORDER BY login_date;
"""

df = pd.read_sql_query(query, conn)


plt.figure(figsize=(10,6))

plt.plot(df['login_date'], df['daily_users'], marker='o')

plt.title('Daily Active Users')

plt.xlabel('Date')

plt.ylabel('Number of Users')

plt.grid(True)

plt.show()

conn.close()
