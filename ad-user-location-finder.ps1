$users = Get-Content C:\Users\RAJN\Desktop\blr-users.txt

foreach($user in $users){
    $city = Get-ADUser -identity $user -Properties city | select -ExpandProperty city
    $co = Get-ADUser -identity $user -Properties co | select -ExpandProperty co
    $office = Get-ADUser -identity $user -Properties office | select -ExpandProperty office
    Add-Content C:\Users\RAJN\Desktop\blr-users-location.csv "$user, $city, $co, $office"
}