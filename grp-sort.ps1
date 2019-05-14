$users = Get-Content C:\Users\RAJN\Desktop\VDI-users.txt

$members_SJC = Get-ADGroupMember -Identity 'g.SJC-HMS-GSS' | select -ExpandProperty SamAccountName

$members_BLR = Get-ADGroupMember -Identity 'g.BLR-HZ-GSS' | select -ExpandProperty SamAccountName

$members_AMS = Get-ADGroupMember -Identity 'g.AMS-HMS-GSS' | select -ExpandProperty SamAccountName

foreach($usr in $users){

    if($members_SJC -contains $usr){
        $list += $usr
        Add-Content C:\Users\RAJN\Desktop\GSS_VDI_Users.csv "$usr"
    }
    elseif($members_BLR -contains $usr){
        $list += $usr
        Add-Content C:\Users\RAJN\Desktop\GSS_VDI_Users.csv "$usr"
    }
    elseif($members_AMS -contains $usr){
        $list += $usr
        Add-Content C:\Users\RAJN\Desktop\GSS_VDI_Users.csv "$usr"
    }
    else{
        write-host "$usr is not part of any GSS group" 
    }
}