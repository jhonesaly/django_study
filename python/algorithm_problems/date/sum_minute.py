# You are given a time T in 24-hour format (hh:mm) and a positive integer K, 
# you have to tell the time after K minutes in 24-hour time.
import datetime

def sum_minute (T:str, K:int|str) -> str:
    date_hour = datetime.strptime(T, "%H:%M")
    if isinstance(K, str):
        K = int(K)
            

    return new_T