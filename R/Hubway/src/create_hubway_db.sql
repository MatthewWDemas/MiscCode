/*
 * SQLite CREATE TABLE examples.
 * Created by Alvin Alexander, http://alvinalexander.com
 * Released under the Creative Commons License.
 */


-- Get Header Information

CREATE TABLE tripdata (
	tripduration, starttime, stoptime, start_station_id, start_station_name, start_station_latitude, start_station_longitude, end_station_id, end_station_name, end_station_latitude, end_station_longitude, bikeid, usertype, birth_year, gender
201501-hubway-tripdata.csv
201502-hubway-tripdata.csv
201503-hubway-tripdata.csv
201504-hubway-tripdata.csv
201505-hubway-tripdata.csv
201506-hubway-tripdata.csv
201507-hubway-tripdata.csv
201508-hubway-tripdata.csv
201509-hubway-tripdata.csv
201510-hubway-tripdata.csv
201511-hubway-tripdata.csv
201512-hubway-tripdata.csv
201601-hubway-tripdata.csv
201602-hubway-tripdata.csv
201603-hubway-tripdata.csv
201604-hubway-tripdata.csv
201605-hubway-tripdata.csv
201606-hubway-tripdata.csv
201607-hubway-tripdata.csv
201608-hubway-tripdata.csv
201609-hubway-tripdata.csv
201610-hubway-tripdata.csv
201611-hubway-tripdata.csv
201612-hubway-tripdata.csv
--
-- coffees
--
CREATE TABLE coffees (
  id INTEGER PRIMARY KEY,
  coffee_name TEXT NOT NULL,
  price REAL NOT NULL
);

--
-- salespeople
--
CREATE TABLE salespeople (
  id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  commission_rate REAL NOT NULL
);

--
-- customers
--
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  company_name TEXT NOT NULL,
  street_address TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  zip TEXT NOT NULL
);

