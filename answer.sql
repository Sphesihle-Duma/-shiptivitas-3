-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

     -- Daily Average Users Before the Feature Change
     SELECT date(datetime(login_timestamp, 'unixepoch')) AS login_date, Count(DISTINCT user_id) AS daily_users 
     FROM login_history
     WHERE datetime(login_timestamp, 'unixepoch') < '2024-09-04' -- assuming that the will be deployed on this date
     GROUP BY login_date
     ORDER BY login_date;


    -- Daily Average Users After the Feature Change
    SELECT date(datetime(login_timestamp, 'unixepoch')) AS login_date, Count(DISTINCT user_id) as daily_users 
    FROM login_history
    WHERE datetime(login_timestamp, 'unixepoch') >= '2024-09-04' -- assuming that the will be deployed on this date
    GROUP BY login_date
    ORDER BY login_date;

-- PART 2: Create a SQL query that indicates the number of status changes by card
    
    SELECT cardID, COUNT(*) AS status_changes
    FROM card_change_history
    GROUP BY cardID
    ORDER BY status_changes;




