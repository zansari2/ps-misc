Start-Process 'C:\windows\system32\notepad.exe'
get-command *alias*
Show-Command Get-Command
help Get-Command -full
write-host $str
dir ..\*.exe
mkdir
Get-Process | Export-Csv procs.csv
diff -reference (Import-Clixml procs.xml) -diff (Get-Process) -Property name
dir > directory.txt
Get-Service | Out-GridView
Get-Service | ConvertTo-Html > htmlTest.txt
Get-Process -name Notepad | Stop-Process
diff -Reference (Get-Content .\TextFile2.txt) -diff (get-content .\TextFile1.txt)
"Create a text file" > TextCreation1.txt
nslookup 192.168.80.194
C:\Windows\system32> Get-Eventlog -newest 50 System | sort oldest, index | select index, time, source
get-service -name *s*
import-csv .\test.csv | select-object -Property *,@{name ="samAccountName";expression={$_.login}}, @{label="Name";expression={$_.login}},@{n="Department";e={$_.dept}}|ft
ft is format table while fl is format list
Select-object -property returns an object
Select-Object -ExpandProperty returns only the property
PS C:\users\zansari\desktop> Get-WmiObject win32_bios | format-table -autoSize
PS C:\users\zansari\desktop> Get-WmiObject win32_bios | ft -Property name, serialnumber
Get-Service | Sort-Object Status | Format-Table -groupBy Status
Get-Service | Sort-Object Status | Format-Table -groupBy Status -wrap
Get-Service | Sort-Object Status | Format-wide -groupBy Status
Get-Service | ft @{name="serviceName";expression={$_.name}},status,displayname
Get-Process | Select name,id,Responding | Ft -AutoSize -wrap
Get-EventLog -List | ft @{n = 'logname';e={$_.LogDisplayName}},@{n="RetDays";e={$_.MinimumRetentionDays}} -AutoSize
Get-Service | sort Status -descending | format-table -GroupBy Status
dir C:\ | fw -column 4
dir c:\windows\*.exe|Format-list Name,VersionInfo,@{Name="Size";Expression={$_.length}}
Start-Process '.\Google Chrome.lnk'
Get-Service | Where-Object -filter { $_.Status -eq 'Running' -AND $_.DisplayName -like "a*"}
$_.property #Placeholder for object followed by appended property of object
Get-process | Where name -ne "*powershell*" | Sort -property Pm -Descending
Get-process | Where name -ne "*powershell*" | Sort -property Pm -Descending | Select-Object -first 10
#Filter left format right

############
#EmailStart#
############
$From = "EmailAddress@gmail.com"
$To = "SomeOtherAddress@whatever.com"
$Cc = "AThirdUser@somewhere.com"
$Attachment = "C:\users\Username\Documents\SomeTextFile.txt"
$Subject = "Here's the Email Subject"
$Body = "This is what I want to say"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) -Attachments $Attachment –DeliveryNotificationOption OnSuccess
##########
#EmailEnd#
##########