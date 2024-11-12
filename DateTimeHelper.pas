{ ***************************************************************************

DateTimeHelper                                                  
https://github.com/colinj 

MIT License

Copyright (c) 2023 - 2024 Colin Johnsun

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*************************************************************************** }

unit DateTimeHelper;

interface

uses
  System.SysUtils,
  System.Types,
  System.DateUtils;

type
  TDateTimeHelper = record helper for TDateTime
    function WithinDays(const DateTime: TDateTime; const Days: Int32): Boolean; inline;
  strict private
    /// <summary>Parse a string as TDateTime, using a string format ex.('MM/dd/yyyy hh:mm:ss')</summary>
    /// <returns> TDateTime</returns>
    /// <param name="Date"> (string) </param>
    /// <param name="Format"> (string) </param>
    /// <param name="DateSeparator"> (Char) </param>
    /// <param name="TimeSeparator"> (Char) </param>
    class function Parse(const Date: string; const Format: string = ''; const DateSeparator: Char = #0; const TimeSeparator: Char = #0): TDateTime; static; inline;
    /// <summary>Parse a string as TDateTime, using Local string ex. ('en-US')</summary>
    /// <returns> TDateTime</returns>
    /// <param name="Date"> (string) </param>
    /// <param name="Local"> (string) </param>
    class function ParseLocal(const Date: string; const Local: string = ''): TDateTime; static; inline;
    function GetDate: TDateTime; inline;
    function GetDay: UInt16; inline;
    function GetDayOfWeek: UInt16; inline;
    function GetDayOfYear: UInt16; inline;
    function GetHour: UInt16; inline;
    function GetMillisecond: UInt16; inline;
    function GetMinute: UInt16; inline;
    function GetMonth: UInt16; inline;
    class function GetNow: TDateTime; static; inline;
    function GetSecond: UInt16; inline;
    function GetTime: TDateTime; inline;
    class function GetToday: TDateTime; static; inline;
    class function GetTomorrow: TDateTime; static; inline;
    function GetTotalSecounds: Int64;
    function GetUnixTime: Int64;
    function GetYear: UInt16; inline;
    class function GetYesterDay: TDateTime; static; inline;
  public
    class function Create(const Date: string; const Format: string = ''; const DateSeparator: Char = #0; const TimeSeparator: Char = #0): TDateTime; overload;
        static; inline;
    class function Create(const Year, Month, Day: UInt16): TDateTime; overload; static; inline;
    class function Create(const Year, Month, Day, Hour, Minute, Second, Millisecond: UInt16): TDateTime; overload; static; inline;
    class function CreateLocal(const Date, Local: string): TDateTime; static; inline;
    class function CreateTotalSeconds(const Value: Int64): TDateTime; static; inline;
    class function CreateUnixTime(const Value: Int64): TDateTime; static; inline;
    function AddDays(const NumberOfDays: Int32 = 1): TDateTime; inline;
    function AddHours(const NumberOfHours: Int64 = 1): TDateTime; inline;
    function AddMilliseconds(const NumberOfMilliseconds: Int64 = 1): TDateTime; inline;
    function AddMinutes(const NumberOfMinutes: Int64 = 1): TDateTime; inline;
    function AddMonths(const NumberOfMonths: Int32 = 1): TDateTime; inline;
    function AddSeconds(const NumberOfSeconds: Int64 = 1): TDateTime; inline;
    function AddYears(const NumberOfYears: Int32 = 1): TDateTime; inline;
    function AsDouble: Double; overload;
    procedure AsDouble(const Value: Double); overload;
    function CompareTo(const DateTime: TDateTime): TValueRelationship; inline;
    function DaysBetween(const DateTime: TDateTime): Integer; inline;
    function EndOfDay: TDateTime; inline;
    function EndOfMonth: TDateTime; inline;
    function EndOfWeek: TDateTime; inline;
    function EndOfYear: TDateTime; inline;
    function Equals(const DateTime: TDateTime): Boolean; inline;
    function HoursBetween(const DateTime: TDateTime): Int64; inline;
    function InRange(const StartDateTime, EndDateTime: TDateTime; const Inclusive: Boolean = True): Boolean; inline;
    function IsAM: Boolean; inline;
    function IsInLeapYear: Boolean; inline;
    function IsPM: Boolean; inline;
    function IsSameDay(const DateTime: TDateTime): Boolean; inline;
    function IsToday: Boolean; inline;
    function MilliSecondsBetween(const DateTime: TDateTime): Int64; inline;
    function MinutesBetween(const DateTime: TDateTime): Int64; inline;
    function MonthsBetween(const DateTime: TDateTime): Integer; inline;
    function SecondsBetween(const DateTime: TDateTime): Int64; inline;
    function StartOfDay: TDateTime; inline;
    function StartOfMonth: TDateTime; inline;
    function StartOfWeek: TDateTime; inline;
    function StartOfYear: TDateTime; inline;
    function ToString(const FormatStr: string = ''): string; inline;
    function WeeksBetween(const DateTime: TDateTime): Int32; inline;
    function WithinHours(const DateTime: TDateTime; const Hours: Int64): Boolean; inline;
    function WithinMilliseconds(const DateTime: TDateTime; const Milliseconds: Int64): Boolean; inline;
    function WithinMinutes(const DateTime: TDateTime; const Minutes: Int64): Boolean; inline;
    function WithinMonths(const DateTime: TDateTime; const Months: Int32): Boolean; inline;
    function WithinSeconds(const DateTime: TDateTime; const Seconds: Int64): Boolean; inline;
    function WithinWeeks(const DateTime: TDateTime; const Weeks: Int32): Boolean; inline;
    function WithinYears(const DateTime: TDateTime; const Years: Int32): Boolean; inline;
    function YearsBetween(const DateTime: TDateTime): Int32; inline;
    class property Now: TDateTime read GetNow;
    class property Today: TDateTime read GetToday;
    class property Tomorrow: TDateTime read GetTomorrow;
    class property Yesterday: TDateTime read GetYesterDay;
    property Date: TDateTime read GetDate;
    property Day: UInt16 read GetDay;
    property DayOfWeek: UInt16 read GetDayOfWeek;
    property DayOfYear: UInt16 read GetDayOfYear;
    property Hour: UInt16 read GetHour;
    property Millisecond: UInt16 read GetMillisecond;
    property Minute: UInt16 read GetMinute;
    property Month: UInt16 read GetMonth;
    property Second: UInt16 read GetSecond;
    property Time: TDateTime read GetTime;
    property TotalSeconds: Int64 read GetTotalSecounds;
    property UnixTime: Int64 read GetUnixTime;
    property Year: UInt16 read GetYear;
  end;

implementation

class function TDateTimeHelper.Create(const Date: string; const Format: string = ''; const DateSeparator: Char = #0; const TimeSeparator: Char = #0): TDateTime;
begin
  Result := Parse(Date, Format, DateSeparator, TimeSeparator);
end;

class function TDateTimeHelper.Create(const Year, Month, Day: UInt16): TDateTime;
begin
  Result := EncodeDate(Year, Month, Day);
end;

class function TDateTimeHelper.Create(const Year, Month, Day, Hour, Minute, Second, Millisecond: UInt16): TDateTime;
begin
  Result := EncodeDateTime(Year, Month, Day, Hour, Minute, Second, Millisecond);
end;

class function TDateTimeHelper.CreateLocal(const Date, Local: string): TDateTime;
begin
  Result:= ParseLocal(Date, Local);
end;

class function TDateTimeHelper.CreateTotalSeconds(const Value: Int64): TDateTime;
begin
  Result := Value / 86400;
end;

class function TDateTimeHelper.CreateUnixTime(const Value: Int64): TDateTime;
begin
  Result := (Value / 86400) + 25569;
end;

class function TDateTimeHelper.GetNow: TDateTime;
begin
  Result := System.SysUtils.Now;
end;

class function TDateTimeHelper.GetToday: TDateTime;
begin
  Result := System.SysUtils.Date;
end;

class function TDateTimeHelper.GetTomorrow: TDateTime;
begin
  Result := IncDay(System.SysUtils.Date);
end;

class function TDateTimeHelper.GetYesterDay: TDateTime;
begin
  Result := IncDay(System.SysUtils.Date, - 1);
end;

class function TDateTimeHelper.Parse(const Date: string; const Format: string = ''; const DateSeparator: Char = #0; const TimeSeparator: Char = #0): TDateTime;
begin
  var Formats: TArray<string> := Format.Split([' ']);
  var LengthFormats := Length(Formats);

  if LengthFormats = 0 then
    Result := StrToDateTime(Date)
  else
  begin
    var FormatSetting :=  TFormatSettings.Create(SysLocale.DefaultLCID);

    if DateSeparator <> #0 then
      FormatSetting.DateSeparator := DateSeparator;

    if not Formats[0].Trim.IsEmpty then
      FormatSetting.ShortDateFormat := Formats[0];

    if LengthFormats > 1 then
    begin
      if TimeSeparator <> #0 then
        FormatSetting.TimeSeparator := TimeSeparator;

      if not Formats[1].Trim.IsEmpty then
        FormatSetting.ShortTimeFormat := Formats[1];
    end;

    Result := StrToDateTime(Date, FormatSetting);
  end;
end;

class function TDateTimeHelper.ParseLocal(const Date: string; const Local: string = ''): TDateTime;
begin
  var FormatSetting: TFormatSettings;

  if Local.Trim.IsEmpty then
    FormatSetting := TFormatSettings.Create(SysLocale.DefaultLCID)
  else
    FormatSetting := TFormatSettings.Create(Local);

  Result := StrToDateTime(Date, FormatSetting);
end;

function TDateTimeHelper.AddDays(const NumberOfDays: Int32 = 1): TDateTime;
begin
  Result := IncDay(Self, NumberOfDays);
end;

function TDateTimeHelper.AddHours(const NumberOfHours: Int64 = 1): TDateTime;
begin
  Result := IncHour(Self, NumberOfHours);
end;

function TDateTimeHelper.AddMilliseconds(const NumberOfMilliseconds: Int64 = 1): TDateTime;
begin
  Result := IncMilliSecond(Self, NumberOfMilliseconds);
end;

function TDateTimeHelper.AddMinutes(const NumberOfMinutes: Int64 = 1): TDateTime;
begin
  Result := IncMinute(Self, NumberOfMinutes);
end;

function TDateTimeHelper.AddMonths(const NumberOfMonths: Int32 = 1): TDateTime;
begin
  Result := IncMonth(Self, NumberOfMonths);
end;

function TDateTimeHelper.AddSeconds(const NumberOfSeconds: Int64 = 1): TDateTime;
begin
  Result := IncSecond(Self, NumberOfSeconds);
end;

function TDateTimeHelper.AddYears(const NumberOfYears: Int32 = 1): TDateTime;
begin
  Result := IncYear(Self, NumberOfYears);
end;

function TDateTimeHelper.AsDouble: Double;
begin
  Result := Self;
end;

procedure TDateTimeHelper.AsDouble(const Value: Double);
begin
  Self := Value;
end;

function TDateTimeHelper.CompareTo(const DateTime: TDateTime): TValueRelationship;
begin
  Result := CompareDateTime(Self, DateTime);
end;

function TDateTimeHelper.DaysBetween(const DateTime: TDateTime): Integer;
begin
  Result := System.DateUtils.DaysBetween(Self, DateTime);
end;

function TDateTimeHelper.EndOfDay: TDateTime;
begin
  Result := EndOfTheDay(Self);
end;

function TDateTimeHelper.EndOfMonth: TDateTime;
begin
  Result := EndOfTheMonth(Self);
end;

function TDateTimeHelper.EndOfWeek: TDateTime;
begin
  Result := EndOfTheWeek(Self);
end;

function TDateTimeHelper.EndOfYear: TDateTime;
begin
  Result := EndOfTheYear(Self);
end;

function TDateTimeHelper.Equals(const DateTime: TDateTime): Boolean;
begin
  Result := SameDateTime(Self, DateTime);
end;

function TDateTimeHelper.GetDate: TDateTime;
begin
  Result := DateOf(Self);
end;

function TDateTimeHelper.GetDay: UInt16;
begin
  Result := DayOf(Self);
end;

function TDateTimeHelper.GetDayOfWeek: UInt16;
begin
  Result := DayOfTheWeek(Self);
end;

function TDateTimeHelper.GetDayOfYear: UInt16;
begin
  Result := DayOfTheYear(Self);
end;

function TDateTimeHelper.GetHour: UInt16;
begin
  Result := HourOf(Self);
end;

function TDateTimeHelper.GetMillisecond: UInt16;
begin
  Result := MilliSecondOf(Self);
end;

function TDateTimeHelper.GetMinute: UInt16;
begin
  Result := MinuteOf(Self);
end;

function TDateTimeHelper.GetMonth: UInt16;
begin
  Result := MonthOf(Self);
end;

function TDateTimeHelper.GetSecond: UInt16;
begin
  Result := SecondOf(Self);
end;

function TDateTimeHelper.GetTime: TDateTime;
begin
  Result := TimeOf(Self);
end;

function TDateTimeHelper.GetTotalSecounds: Int64;
begin
  Result := Trunc(86400 * self);
end;

function TDateTimeHelper.GetUnixTime: Int64;
begin
  Result := Trunc((self - 25569) * 86400);
end;

function TDateTimeHelper.GetYear: UInt16;
begin
  Result := YearOf(Self);
end;

function TDateTimeHelper.HoursBetween(const DateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.HoursBetween(Self, DateTime);
end;

function TDateTimeHelper.InRange(const StartDateTime, EndDateTime: TDateTime; const Inclusive: Boolean = True): Boolean;
begin
  Result := DateTimeInRange(Self, StartDateTime, EndDateTime, Inclusive);
end;

function TDateTimeHelper.IsAM: Boolean;
begin
  Result := System.DateUtils.IsAM(Self);
end;

function TDateTimeHelper.IsInLeapYear: Boolean;
begin
  Result := System.DateUtils.IsInLeapYear(Self);
end;

function TDateTimeHelper.IsPM: Boolean;
begin
  Result := System.DateUtils.IsPM(Self);
end;

function TDateTimeHelper.IsSameDay(const DateTime: TDateTime): Boolean;
begin
  Result := System.DateUtils.IsSameDay(Self, DateTime);
end;

function TDateTimeHelper.IsToday: Boolean;
begin
  Result := System.DateUtils.IsToday(Self);
end;

function TDateTimeHelper.MilliSecondsBetween(const DateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.MilliSecondsBetween(Self, DateTime);
end;

function TDateTimeHelper.MinutesBetween(const DateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.MinutesBetween(Self, DateTime);
end;

function TDateTimeHelper.MonthsBetween(const DateTime: TDateTime): Integer;
begin
  Result := System.DateUtils.MonthsBetween(Self, DateTime);
end;

function TDateTimeHelper.SecondsBetween(const DateTime: TDateTime): Int64;
begin
  Result := System.DateUtils.SecondsBetween(Self, DateTime);
end;

function TDateTimeHelper.StartOfDay: TDateTime;
begin
  Result := StartOfTheDay(Self);
end;

function TDateTimeHelper.StartOfMonth: TDateTime;
begin
  Result := StartOfTheMonth(Self);
end;

function TDateTimeHelper.StartOfWeek: TDateTime;
begin
  Result := StartOfTheWeek(Self);
end;

function TDateTimeHelper.StartOfYear: TDateTime;
begin
  Result := StartOfTheYear(Self);
end;

function TDateTimeHelper.ToString(const FormatStr: string = ''): string;
begin
  if FormatStr.IsEmpty then
    Result := DateToStr(Self)
  else
    Result := FormatDateTime(FormatStr, Self);
end;

function TDateTimeHelper.WeeksBetween(const DateTime: TDateTime): Int32;
begin
  Result := System.DateUtils.WeeksBetween(Self, DateTime);
end;

function TDateTimeHelper.WithinDays(const DateTime: TDateTime; const Days: Int32): Boolean;
begin
  Result := System.DateUtils.WithinPastDays(Self, DateTime, Days);
end;

function TDateTimeHelper.WithinHours(const DateTime: TDateTime; const Hours: Int64): Boolean;
begin
  Result := System.DateUtils.WithinPastHours(Self, DateTime, Hours);
end;

function TDateTimeHelper.WithinMilliseconds(const DateTime: TDateTime; const Milliseconds: Int64): Boolean;
begin
  Result := System.DateUtils.WithinPastMilliSeconds(Self, DateTime, Milliseconds);
end;

function TDateTimeHelper.WithinMinutes(const DateTime: TDateTime; const Minutes: Int64): Boolean;
begin
  Result := System.DateUtils.WithinPastMinutes(Self, DateTime, Minutes);
end;

function TDateTimeHelper.WithinMonths(const DateTime: TDateTime; const Months: Int32): Boolean;
begin
  Result := System.DateUtils.WithinPastMonths(Self, DateTime, Months);
end;

function TDateTimeHelper.WithinSeconds(const DateTime: TDateTime; const Seconds: Int64): Boolean;
begin
  Result := System.DateUtils.WithinPastSeconds(Self, DateTime, Seconds);
end;

function TDateTimeHelper.WithinWeeks(const DateTime: TDateTime; const Weeks: Int32): Boolean;
begin
  Result := System.DateUtils.WithinPastWeeks(Self, DateTime, Weeks);
end;

function TDateTimeHelper.WithinYears(const DateTime: TDateTime; const Years: Int32): Boolean;
begin
  Result := System.DateUtils.WithinPastYears(Self, DateTime, Years);
end;

function TDateTimeHelper.YearsBetween(const DateTime: TDateTime): Int32;
begin
  Result := System.DateUtils.YearsBetween(Self, DateTime);
end;

end.

