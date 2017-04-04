#!/usr/bin/python3.5
import os
import time
import subprocess
import dbus

print ('{ "version": 1 , "click_events": true}', end="")
print ('[', end="")
print ('[]', end="")

soundColor = '';
powerColor = '';
dateTimeColor = '';

sleep =1 
session_bus = dbus.SessionBus()

def power():
    is_battery = os.path.isfile("/sys/class/power_supply/BAT0/energy_now")
    if is_battery:
        battery_power()
    else:
        print (',{"full_text":"NO BAT!","color":"#b20000"}', end=""),

def battery_power():

    energy_full = subprocess.check_output("cat /sys/class/power_supply/BAT0/energy_full", shell=True)
    energy_now = subprocess.check_output("cat /sys/class/power_supply/BAT0/energy_now", shell=True)
    energy_full_design = subprocess.check_output("cat /sys/class/power_supply/BAT0/energy_full_design", shell=True)
    battery_status = subprocess.check_output("cat /sys/class/power_supply/BAT0/status", shell=True)

    energy_full = int(energy_full)
    energy_now = int(energy_now)
    battery = ""

    percentage_energy_now = float(energy_now) * 100 / float(energy_full)
    percentage_energy_now = float("{0:.2f}".format(percentage_energy_now))

    if percentage_energy_now < 25 :
        battery = ""
    elif percentage_energy_now >= 25 and percentage_energy_now < 50 :
        battery = " "
    elif percentage_energy_now >= 50 and percentage_energy_now < 75 :
        battery = ""
    elif percentage_energy_now >= 75 and percentage_energy_now < 97 :
        battery = ""
    elif percentage_energy_now >= 97 :
        battery = ""
        percentage_energy_now = 100

    if percentage_energy_now < 25:
        print(',{"color": "#b20000",', end=""),
    elif percentage_energy_now > 75:
        print(',{"color": "#859900",', end=""),
    else:
        print(',{', end=""),

    battery_status = str(battery_status)[2:len(battery_status) + 1]

    if battery_status == "Discharging" :
        battery_status = "DIS"
    elif percentage_energy_now == 100 :
        battery_status = "FULL"
    else :
        battery_status = "NORM"

    print ('"full_text":"',battery_status,' : ',battery,' ',percentage_energy_now,'% "}', end=""),

def date():
    date = subprocess.check_output("date \"+%d/%m %H:%M\"",shell=True)
    print (',{"color":"#268bd2", "name":"time","full_text":"',str(date)[2:len(date) + 1],'"}', end=""),

def volume():
    vol =  subprocess.check_output("amixer | grep Front\ Left:\ Playback", shell=True)
    a, b, c, d, VOLUME, MUTED = vol.split()
    if str(MUTED)[2:len(MUTED) + 2]  == "[off]" :
        print (',{"color": "#ffff00", "name":"sound","full_text":"  ',str(VOLUME)[3:len(VOLUME) + 1],'"}', end=""),
    else :
        print (',{"color":"268bd2","name":"sound","full_text":"  ',str(VOLUME)[3:len(VOLUME) + 1],' "}',sep="", end=""),

def musicSpotify():
    try:
        spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
        spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")
        metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")
        if(metadata['xesam:title']) == "":
            musicMpd()
            #print('{"name":"music", "full_text":""}', end=""),
        else:
            print('{"min_width": 700,"align":"center", "color":"#20bf9f","name":"music","full_text":"Current track : ',metadata['xesam:title'] ,'"}'),
    except:
            musicMpd()
            #print('{"name":"music","full_text":""}'),

def musicMpd():
    try:
        current_track = subprocess.check_output("ncmpcpp --current-song 2> /dev/null", shell=True).decode()
        current_track = str(current_track)[0:len(current_track) + 2]
        print('{"color":"#b58900","name":"musicMpd", "full_text":"',current_track,'"}', end=""),
    except:
        print('{"name":"music","full_text":""}')

def disc():
    freeSpace = subprocess.check_output("df -h | grep /dev/sda1 | cut -d\" \" -f12", shell=True)
    freeSpace = str(freeSpace)[2:len(freeSpace) + 1]

    print(',{"color":"#cb4b16", "name":"disc", "full_text" : ": ',freeSpace,'"}'),

while True:
    print (',[', end=""),
    musicSpotify()
    disc()
    volume()
    power()
    date()
    print (']')
    if sleep == 1 :
        time.sleep(0.05)
    else : 
        time.sleep(0.01)

