---@meta

C4Scheduler = {}

--- This API adds an event which occurs once.
function C4Scheduler:AddSingleDayEntry(name, start_time, options) end

--- This API adds an event which occurs daily at sunset and can be randomized by a range of 60 minutes. Sunset time is based data provided by Director.
function C4Scheduler:AddDailySunsetRandomOffsetEntry(name, random_range_minutes, start_time, end_date, options) end

--- This API adds an event which occurs on defined days of the week.
function C4Scheduler:AddDaysOfTheWeekEntry(name, days_of_the_week, start_time, end_date, options) end

--- This API adds an event which occurs set number of months. For example, an event that occurs every 4 months.
function C4Scheduler:AddEveryXMonthsEntry(name, num_months, start_time, end_date, options) end

--- This API adds an event which occurs on the same day(s) of the week over a defined period of weeks. For example, an event that occurs every Tuesday and Wednesday - every three weeks
function C4Scheduler:AddSetDaysEveryXWeeksEntry(name, days_of_the_week, num_weeks, start_time, end_date, options) end

--- This API adds an event which occurs set number of years. For example, an event that occurs every 4 years.
function C4Scheduler:AddEveryXYearsEntry(name, num_years, start_time, end_date, options) end

--- Deletes and Event based on the Event ID value passed. A driver can only delete events which were created by that driver.
function C4Scheduler:DeleteEntryByID(event_id) end