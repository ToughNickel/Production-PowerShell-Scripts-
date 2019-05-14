

$temp = Get-Content C:\Users\RAJN\Desktop\users-BLR_HZ_FIN.csv
$temp2 = Get-Content C:\Users\RAJN\Desktop\users-BLR_HMS_FIN2.csv

foreach($usr in $temp){
    $usr = $usr.Replace('"','')

    New-Item -Path "\\l3c-daas.blr04-isl1c.oc.vmware.com\blr02-daas\BLR-DAP\Profiles\" -Name "$usr" -ItemType "directory"

    Copy-Item "\\l3c-daas.blr04-isl1c.oc.vmware.com\blr02-daas\BLR-UEM\UEMprofiles\$usr\*" -Destination "\\l3c-daas.blr04-isl1c.oc.vmware.com\blr02-daas\BLR-DAP\Profiles\$usr" -Recurse
        
    Remove-Item -Path "\\l3c-daas.blr04-isl1c.oc.vmware.com\blr02-daas\BLR-DAP\Profiles\$usr\Archives\Microsoft Office 2016" -Recurse

    Remove-Item -Path "\\l3c-daas.blr04-isl1c.oc.vmware.com\blr02-daas\BLR-DAP\Profiles\$usr\Backups\Microsoft Office 2016" -Recurse
}