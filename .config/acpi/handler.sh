#!/bin/bash

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF) logger 'PowerButton pressed' ;;
            *) logger "ACPI action undefined: $2" ;;
        esac ;;

    button/sleep)
        case "$2" in
            SLPB|SBTN) logger 'SleepButton pressed';
                       export DISPLAY=:0;
                       ~/.config/i3/scripts/lock ;;
            *) logger "ACPI action undefined: $2" ;;
        esac ;;

    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000) logger 'AC unpluged' ;;
                    00000001) logger 'AC pluged' ;;
                esac ;;
            *) logger "ACPI action undefined: $2" ;;
        esac ;;

    battery)
        case "$2" in
            BAT0)
                case "$4" in 00000000) logger 'Battery online' ;;
                             00000001) logger 'Battery offline' ;;
                esac ;;
            CPU0) ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac ;;

    jack/headphone)
        case "$3" in
            plug) pkill -RTMIN+1 i3blocks ;;
            unplug) pkill -RTMIN+1 i3blocks ;;
    esac ;;

    button/lid)
        case "$3" in
            close) logger 'LID closed';
                   export DISPLAY=:0;
                   ~/.config/i3/scripts/lock ;;
            open) logger 'LID opened';
                  ~/.config/i3/scripts/backlight on ;;
            *) logger "ACPI action undefined: $3" ;;
    esac ;;

    *) logger "ACPI group/action undefined: $1 / $2" ;;
esac
