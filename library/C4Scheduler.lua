---@meta

C4Scheduler = {}

---@class ScheduleEntryOptions
---@field hidden? boolean Boolean defaults to false. True prevents the Event from displaying in the Scheduler Agent in ComposerPro
---@field user_hidden? boolean Boolean defaults to false. Setting to true prevents the Event from displaying on Navigators.
---@field category? string String value available to the driver writer to use however they see fit. Can be used to categorize events.
---@field enabled? boolean Boolean defaults to true. Setting enabled to false will disable the Event.
---@field locked? boolean Boolean which defaults to false. Setting enabled to true will place the Event in a read only state.

---@class ScheduleEntryTime
---@field year number
---@field month number
---@field day number
---@field hour number
---@field minute number

---@alias Weekday
---| "SUNDAY"
---| "MONDAY"
---| "TUESDAY"
---| "WEDNESDAY"
---| "THURSDAY"
---| "FRIDAY"
---| "SATURDAY"

---@alias Period
---| "FIRST"
---| "SECOND"
---| "THIRD"
---| "FOURTH"
---| "LAST"

---This API adds an event which occurs once.
---@param name string String value of the name of the event being added.
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddSingleDayEntry(name, start_time, options) end

---This API adds an event which occurs repetitively.
---@param name string String value of the name of the event being added.
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailyRepeatEntry(name, start_time, end_date, options) end

---This API adds an event which occurs repetitively and can be offset by a range of 60 minutes.
---@param name string String value of the name of the event being added.
---@param random_range_minutes number Random range of minutes. number = number of minutes, range = (1-60)
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailyRepeatRandomOffsetEntry(name, random_range_minutes, start_time, end_date, options) end

---This API adds an event which occurs repetitively, on a set number of days.
---@param name string String value of the name of the event being added.
---@param every_num_days number Random range of minutes. number = number of minutes, range = (1-100)
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddRepeatXDaysEntry(name, every_num_days, start_time, end_date, options) end

---This API adds an event which occurs daily at sunrise. Sunrise time is based data provided by Director.
---@param name string String value of the name of the event being added.
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailySunriseEntry(name, start_time, end_date, options) end

---This API adds an event which occurs daily at sunrise. Sunrise time is based data provided by Director.
---@param name string String value of the name of the event being added.
---@param offset_minutes number Offset minutes includes: number, number of minutes, range (-360 - 360)
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailySunriseOffsetEntry(name, offset_minutes, start_time, end_date, options) end

---This API adds an event which occurs daily at sunrise and can be randomized by a range of 60 minutes. Sunrise time is based data provided by Director.
---@param name string String value of the name of the event being added.
---@param random_range_minutes number Random range of minutes. number = number of minutes, range = (1-60)
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailySunriseRandomOffsetEntry(name, random_range_minutes, start_time, end_date, options) end

---This API adds an event which occurs daily at sunset. Sunset time is based data provided by Director.
---@param name string String value of the name of the event being added.
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailySunsetEntry(name, start_time, end_date, options) end

---This API adds an event which occurs daily at sunset and can be offset by a range of 360 minutes. Use a negative number for pre-sunset and a positive number for post sunset. Sunset time is based data provided by Director.
---@param name string String value of the name of the event being added.
---@param offset_minutes number Offset minutes includes: number, number of minutes, range (-360 - 360)
---@param start_time ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param end_date? ScheduleEntryTime Optional table that includes: year, month, day, hour using the 24 hour clock, minute. Default time is 12:00 AM
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailySunsetOffsetEntry(name, offset_minutes, start_time, end_date, options) end

---This API adds an event which occurs daily at sunset and can be randomized by a range of 60 minutes. Sunset time is based data provided by Director.
---@param name string String value of the name of the event being added.
---@param random_range_minutes table Random range of minutes. number = number of minutes, range = (1-60)
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. minute is optional The default time is 12:00 AM.
---@param end_date? ScheduleEntryTime end date. optional. includes: year, month, day
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDailySunsetRandomOffsetEntry(name, random_range_minutes, start_time, end_date, options) end

---This API adds an event which occurs at the end of the month defined in the start table.
---@param name string String value of the name of the event being added.
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. minute is optional The default time is 12:00 AM.
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddEndOfMonthEntry(name, start_time, options) end

---This API adds an event which occurs at the end of the month defined in the start table.
---@param name string String value of the name of the event being added.
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. minute is optional The default time is 12:00 AM.
---@param end_date? ScheduleEntryTime end date. optional. includes: year, month, day
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddEndOfMonthRepeatEntry(name, start_time, end_date, options) end

---This API adds an event which occurs at the designated (Nth) day of every week in relation to that days occurrence in a month. For example, an event that occurs on the second Tuesday of the month of May.
---@param name string String value of the name of the event being added.
---@param period Period Period values of: FIRST, SECOND, THIRD, FOURTH, LAST
---@param weekday Weekday Weekday values of: SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. minute is optional The default time is 12:00 AM.
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddNthWeekdayOfMonthEntry(name, period, weekday, start_time, options) end

---This API adds an event which occurs at the designated (Nth) day of every week in relation to that days occurrence in a month. For example, an event that occurs on the second Tuesday of the month of May.
---@param name string String value of the name of the event being added.
---@param period Period Period values of: FIRST, SECOND, THIRD, FOURTH, LAST
---@param weekday Weekday Weekday values of: SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. minute is optional The default time is 12:00 AM.
---@param end_date? ScheduleEntryTime end date. optional. includes: year, month, day
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddNthWeekdayOfMonthRepeatEntry(name, period, weekday, start_time, end_date, options) end

---This API adds an event which occurs on defined days of the week.
---@param name string String value of the name of the event being added.
---@param days_of_the_week Weekday Weekday values of: SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. minute is optional The default time is 12:00 AM.
---@param end_date? ScheduleEntryTime end date. optional. includes: year, month, day
---@param options? ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddDaysOfTheWeekEntry(name, days_of_the_week, start_time, end_date, options) end

---This API adds an event which occurs on the same day(s) of the week over a defined period of weeks. For example, an event that occurs every Tuesday and Wednesday - every three weeks
---@param name string String value of the name of the event being added.
---@param days_of_the_week Weekday Weekday values of: SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
---@param num_weeks number Value between 1 and 100. Number of week between the event occurring
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. Minute is optional The default time is 12:00 AM.
---@param end_date? ScheduleEntryTime end date. optional. includes: year, month, day
---@param options ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddSetDaysEveryXWeeksEntry(name, days_of_the_week, num_weeks, start_time, end_date, options) end

---This API adds an event which occurs on the same day(s) of the week over a defined period of weeks. For example, an event that occurs every Tuesday and Wednesday - every three weeks
---@param name string String value of the name of the event being added.
---@param num_years number number of years. range: (1-100)
---@param start_time ScheduleEntryTime start time includes year, month, day, hour using 24 hour clock. Minute is optional The default time is 12:00 AM.
---@param end_date? ScheduleEntryTime end date. optional. includes: year, month, day
---@param options ScheduleEntryOptions Extra options
---@return number value The added Event ID value.
function C4Scheduler:AddSetDaysEveryXYearsEntry(name, num_years, start_time, end_date, options) end

---Deletes and Event based on the Event ID value passed. A driver can only delete events which were created by that driver.
---@param event_id number ID value of the name of the event being deleted.
function C4Scheduler:DeleteEntryByID(event_id) end
