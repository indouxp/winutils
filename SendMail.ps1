
$username = "indou.tsystem"
$password = "intatsu1645"
$myhost = "smtp.gmail.com"
$port = 587

$from = "indou.tsystem@gmail.com"
$recipients = "tatsuo-i@mtb.biglobe.ne.jp"
$subject = "テストメール"

$body = "こんにちは。テストです。"

$sc = New-Object Net.Mail.SmtpClient
$sc.Host = $myhost
$sc.Port = $port
$sc.Enablessl = $true

$sc.Credentials = New-Object Net.NetworkCredential
$sc.Credentials.UserName = $username
$sc.Credentials.password = $password

$sc.send($from, $recipients, $subject, $body)
