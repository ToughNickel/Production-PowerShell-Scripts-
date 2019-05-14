$users = Get-Content C:\Users\RAJN\Desktop\users_list.csv
foreach($user in $users){
    New-Item -Path "\\l3-daas.nl01st-isl1c.oc.vmware.com\ams01-daas\AMS-DAP\Profiles\" -Name "$user" -ItemType "directory"

    Copy-Item "\\l3-daas.nl01st-isl1c.oc.vmware.com\ams01-daas\AMS-UEM\UEMprofiles\$user\*" -Destination "\\l3-daas.nl01st-isl1c.oc.vmware.com\ams01-daas\AMS-DAP\Profiles\$user" -Recurse
        
    Remove-Item -Path "\\l3-daas.nl01st-isl1c.oc.vmware.com\ams01-daas\AMS-DAP\Profiles\$user\Archives\Microsoft Office 2016" -Recurse

    Remove-Item -Path "\\l3-daas.nl01st-isl1c.oc.vmware.com\ams01-daas\AMS-DAP\Profiles\$user\Backups\Microsoft Office 2016" -Recurse
}