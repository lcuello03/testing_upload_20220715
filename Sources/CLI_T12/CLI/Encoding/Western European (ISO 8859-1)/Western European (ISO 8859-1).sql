create table dateTimeTable(
    dateCol date,
    timeCol time,
	timestampcol TIMESTAMP,
	charToNumCol varchar(20)
)

select cast(date '2018-05-02' as varchar);

select cast(current_timestamp as varchar);

select cast(time '10:30:45' as varchar);


select cast(dateCol as varchar) from dateTimeTable;

select cast(timeCol as varchar) from dateTimeTable;

select cast(timestampcol as varchar) from dateTimeTable;

select cast( charToNumCol as FLOAT) from dateTimeTable;

SELECT CAST(timeCol AS TIMESTAMP(1) AT SOURCE TIME ZONE)from dateTimeTable;

