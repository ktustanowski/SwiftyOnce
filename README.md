# SwiftyOnce
Unit test friendly dispatch_once replacement for Swift3.

## Carthage
```
github "ktustanowski/SwiftyOnce" == 0.1.0
```
I tried DispatchQueue extension at first but I had issues with loading Dispatch in unit tests which seems to be or was a known bug - this radar says its fixed -> https://openradar.appspot.com/radar?id=4624971611504640

Thanks Rolling-Rabbits for the idea -> http://rolling-rabbits.com/2016/07/21/grand-central-dispatch-in-swift-3/
