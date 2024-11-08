from datetime import date, timedelta
from datetime import datetime
import requests
import json
import sys
import os

#Author: Ayoub Ech-chetyouy
#42 login: aech-che

today = date.today()
url = "https://logtime-med.1337.ma/api/get_log"
if len(sys.argv) < 2:
	user = os.popen("users").read().strip()
else :
	user = sys.argv[1]

first_day_of_current_month = today.replace(day=1)
last_day_of_last_month = first_day_of_current_month - timedelta(days=1)
start_date = last_day_of_last_month.replace(day=29)
end_date = today.replace(day=28)


payload = f'{{"login": "{user}", "startDate": "{today}T00:00:00.000Z", "endDate": "{today}T23:59:59.999Z"}}'
payload2 = f'{{"login": "{user}", "startDate": "{start_date}T00:00:00.000Z", "endDate": "{end_date}T23:59:59.999Z"}}'


headers = {
  	'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data = payload)
response2 = requests.request("POST", url, headers=headers, data = payload2)
try:
	today_hours = int((json.loads(response.text)['hydra:member'])[0]['totalHours'])
except:
	today_hours = 0
total_hours = int((json.loads(response2.text)['hydra:member'])[0]['totalHours'])
now = datetime.now()
dt_string = now.strftime("%d")

data = os.popen("who").read().strip()
components =  data.split()
month = components[2]
day = int(components[3])
time_str = components[4]
current_datetime = datetime.now()
parsed_datetime = datetime(current_datetime.year, datetime.strptime(month, '%b').month, day)
parsed_time = datetime.strptime(time_str, '%H:%M')
parsed_datetime += timedelta(hours=parsed_time.hour, minutes=parsed_time.minute)
time_difference = current_datetime - parsed_datetime
hours_difference = time_difference.total_seconds() / 3600

logtime_header = '\033[95m' + '''
.__                 __  .__                
|  |   ____   _____/  |_|__| _____   ____  
|  |  /  _ \\ / ___\\   __\\  |/     \\_/ __ \\ 
|  |_(  <_> ) /_/  >  | |  |  Y Y  \\  ___/ 
|____/\\____/\\___  /|__| |__|__|_|  /\\___  >
           /_____/               \\/     \\/
''' + '\033[0m'

print(logtime_header)

green_color = '\033[92m'
yellow_color = '\033[93m'
red_color = '\033[91m'
reset_color = '\033[0m'
brown_color = '\033[33m'
orange_color = '\033[38;5;208m'


print(f"{green_color}\tYour total hours for today       : {today_hours}\t\tafter logout ~  [{int(hours_difference + today_hours)}]{reset_color}")
print(f"{yellow_color}\tYour total hours for this month  : {total_hours}\t\tafter logout ~  [{int(hours_difference + total_hours)}]{reset_color}")



if (28 - int(dt_string) > 11) : 
    color = brown_color
if (28 - int(dt_string) >= 10):
	color = orange_color
else:
	color = red_color

dt_int = int(dt_string)
if (dt_int >= 28):
	dt_int = 27

est = (120 - total_hours) / (28 - dt_int)

if (28 - int(dt_string) > 0 and est > 0) :
	print(f"{color}\tLeft days                        : {28 - int(dt_string)}\t\tEstimated[{est:.1f}h/d] {reset_color}")
else : 
	print(f"{color}\tEligible for a scholarship [if you're not blacklisted :)]{reset_color}")

if (28 - int(dt_string) > 0 and est > 0) :
    if (int(hours_difference + total_hours) >= 120):
        print(f"{green_color}\tYou are eligible for a scholarship{reset_color}")
    else:
        print(f"{red_color}\tYou are not eligible for a scholarship{reset_color}")
