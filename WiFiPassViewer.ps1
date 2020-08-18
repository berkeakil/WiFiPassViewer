echo "                                                                                                   
----------------------------------------------------------------------------------------------------------------------
                                                                                                  
BBBBBBBBBBBBBBBBB         333333333333333        RRRRRRRRRRRRRRRRR        KKKKKKKKK    KKKKKKK      333333333333333   
B::::::::::::::::B       3:::::::::::::::33      R::::::::::::::::R       K:::::::K    K:::::K     3:::::::::::::::33 
B::::::BBBBBB:::::B      3::::::33333::::::3     R::::::RRRRRR:::::R      K:::::::K    K:::::K     3::::::33333::::::3
BB:::::B     B:::::B     3333333     3:::::3     RR:::::R     R:::::R     K:::::::K   K::::::K     3333333     3:::::3
  B::::B     B:::::B                 3:::::3       R::::R     R:::::R     KK::::::K  K:::::KKK                 3:::::3
  B::::B     B:::::B                 3:::::3       R::::R     R:::::R       K:::::K K:::::K                    3:::::3
  B::::BBBBBB:::::B          33333333:::::3        R::::RRRRRR:::::R        K::::::K:::::K             33333333:::::3 
  B:::::::::::::BB           3:::::::::::3         R:::::::::::::RR         K:::::::::::K              3:::::::::::3  
  B::::BBBBBB:::::B          33333333:::::3        R::::RRRRRR:::::R        K:::::::::::K              33333333:::::3 
  B::::B     B:::::B                 3:::::3       R::::R     R:::::R       K::::::K:::::K                     3:::::3
  B::::B     B:::::B                 3:::::3       R::::R     R:::::R       K:::::K K:::::K                    3:::::3
  B::::B     B:::::B                 3:::::3       R::::R     R:::::R     KK::::::K  K:::::KKK                 3:::::3
BB:::::BBBBBB::::::B     3333333     3:::::3     RR:::::R     R:::::R     K:::::::K   K::::::K     3333333     3:::::3
B:::::::::::::::::B      3::::::33333::::::3     R::::::R     R:::::R     K:::::::K    K:::::K     3::::::33333::::::3
B::::::::::::::::B       3:::::::::::::::33      R::::::R     R:::::R     K:::::::K    K:::::K     3:::::::::::::::33 
BBBBBBBBBBBBBBBBB         333333333333333        RRRRRRRR     RRRRRRR     KKKKKKKKK    KKKKKKK      333333333333333
                                         
----------------------------------------------------------------------------------------------------------------------
                                                                                                  "
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ "WIFI SSID"=$name;PASSWORD=$pass }} | Format-Table -AutoSize | Out-File wifipasses.txt
echo "All the passwords written to wifipasses.txt file."
type wifipasses.txt
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
