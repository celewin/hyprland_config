from pulsectl import Pulse, PulseVolumeInfo
import sys

print(sys.argv[1])
with Pulse() as pulse:
    for sink in pulse.sink_input_list():
        #print(json.dumps(sink.proplist, indent=4))
        if sink.proplist.get("application.name") == "Google Chrome":
            if sink.volume.value_flat == 1.0:
                pulse.volume_set(sink, PulseVolumeInfo([int(sys.argv[1])/100.0]))
            else:
                pulse.volume_set(sink, PulseVolumeInfo([1.0]))