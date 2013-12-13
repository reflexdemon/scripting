#Basic Scripting Utility

Please use the following command to check if the site existed  

```
curl -s  https://raw.github.com/reflexdemon/scripting/master/test_url.sh | URL="http://www.google.com" bash
```

##Sample usage
```
$ curl -s  https://raw.github.com/reflexdemon/scripting/master/test_url.sh | URL="http://www.google.com" bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13076    0 13076    0     0  25521      0 --:--:-- --:--:-- --:--:-- 25489
Size is 13076 bytes
Test Passed 13K data downloaded.
$ curl -s  https://raw.github.com/reflexdemon/scripting/master/test_url.sh | URL="http://www.googleisreallybad.com" bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: www.googleisreallybad.com
Size is 0 bytes
Test Failed.
```
