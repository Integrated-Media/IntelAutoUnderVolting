param (
    [string]$under = -10
)
$xtu_path = 'C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client\XTUCli.exe'
$status = get-service -name "XTU3SERVICE" | Select-Object {$_.status} | format-wide
if ($status -ne "Running") { start-service -name "XTU3SERVICE"}
# Undervolt Settings in mV
& $xtu_path -t -id 100 -v $under
stop-process -id $PID -force