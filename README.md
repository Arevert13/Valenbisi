Valenbisi Availability Tracker

This script allows you to track the availability of bikes at specific Valenbisi stations in real-time. It retrieves data every 5 seconds, logs the availability of bikes at the station of your choice, and stores historical data in a file for future reference.

Features
Real-time Data Collection: Retrieves data from Valenbisi's availability service every 5 seconds.
Station-specific Tracking: Monitors the availability of bikes for a specific Valenbisi station by name.
Historical Data Logging: Saves a log of bike availability with timestamps in a CSV file, including the station name and the number of available bikes.
How it Works
The script requests the current bike availability from Valenbisi's service every 5 seconds.
It filters the data based on the station name you provide.
The current availability for that station is returned and displayed.
The availability data is also appended to a historical log file, which includes:
Timestamp (date and time of the query)
Station name
Number of available bikes
