mute=$( pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( $SINK + 1 )) | tail -n 1 )
volume=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )

echo $mute

if [[ "$mute" == *"Mute: yes"* ]]; then
	volnoti-show --mute
else
	volnoti-show $volume
fi


