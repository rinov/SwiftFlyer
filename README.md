# SwiftFlyer

An API wrapper for bitFlyer that supports all providing API.

[![Swift](https://img.shields.io/badge/Swift-4-blue.svg)](https://img.shields.io/badge/Swift-4-blue.svg)
[![Platform](https://img.shields.io/badge/Platform-iOS%7CMacOS-orange.svg)](https://img.shields.io/badge/Platform-iOS%7CMacOS-orange.svg)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-compatible-brightgreen.svg)](https://img.shields.io/badge/Cocoapods-compatible-brightgreen.svg)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)]((https://img.shields.io/badge/Carthage-compatible-brightgreen.svg))
[![License](https://img.shields.io/badge/LICENSE-MIT-yellowgreen.svg)](https://img.shields.io/badge/LICENSE-MIT-yellowgreen.svg)

## API Document

https://lightning.bitflyer.jp/docs

## Usage

### Public API

Fetch a market list.

```swift
import SwiftFlyer

let request = GetMarketListRequest()

ApiSession.shared.send(request) { result in
    switch result {
    case .success(let markets):
      print(markets)
    case .failed(let e):
      // Error handling
      break
    }
}
```

Response:
```
[
  SwiftFlyer.Market(productCode: SwiftFlyer.ProductCode.btc_jpy, alias: nil),
  SwiftFlyer.Market(productCode: SwiftFlyer.ProductCode.fx_btc_jpy, alias: nil),
  SwiftFlyer.Market(productCode: SwiftFlyer.ProductCode.eth_btc, alias: nil),
  SwiftFlyer.Market(productCode: SwiftFlyer.ProductCode.bch_btc, alias: nil)
]
```

### Private API

Generate API keys: https://lightning.bitflyer.jp/developer

Check your balance.

```swift
import SwiftFlyer
...

// For access private API.
BitFlyer.apiKey = // Your API Key
BitFlyer.apiSecretKey = // Your API Secret Key

let request = GetBalanceRequest()

ApiSession.shared.send(request) { result in
    switch result {
    case .success(let markets):
      print(markets)
    case .failed(let e):
      // Error handling
      break
    }
}
```

Response:
```
[
  SwiftFlyer.Balance(amount: 0.0, available: 0.0, currencyCode: SwiftFlyer.CurrencyCode.jpy),
  SwiftFlyer.Balance(amount: 0.0, available: 0.0, currencyCode: SwiftFlyer.CurrencyCode.btc),
  SwiftFlyer.Balance(amount: 0.0, available: 0.0, currencyCode: SwiftFlyer.CurrencyCode.bch),
  SwiftFlyer.Balance(amount: 0.0, available: 0., currencyCode: SwiftFlyer.CurrencyCode.eth),
  SwiftFlyer.Balance(amount: 0.0, available: 0.0, currencyCode: SwiftFlyer.CurrencyCode.etc),
  SwiftFlyer.Balance(amount: 0.0, available: 0.0, currencyCode: SwiftFlyer.CurrencyCode.ltc),
  SwiftFlyer.Balance(amount: 0.0, available: 0.0, currencyCode: SwiftFlyer.CurrencyCode.mona)
]
```

### RealTime API (JSON RPC over WebSocket)

Use RealTImeAPI in your project.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    // If you want retrive realtime information, set channels and call `subscribe` of RealTimeAPI.
    typealias Channel = RealTimeAPI.SubscribeChannel

    // Set channels for subscribing realtime api from bitFlyer RealTimeAPI by using JSON RPC over WebSocket.
    let subscribeChannels: [String] = [
    Channel.SnapShot.boardSnap_fx_btc_jpy.targetChannel,
    Channel.Board.board_fx_btc_jpy.targetChannel,
    Channel.Ticker.ticker_fx_btc_jpy.targetChannel,
    Channel.Execution.execution_fx_btc_jpy.targetChannel
    ]

    // Start observing realtime API.
    RealTimeAPI.shared.subscribe(with: subscribeChannels)

    ...
}
```

After subscribe realtime API, you should implement `RealTimeAPIDelegate` into your class.

```swift

class ViewController: UIViewController {    

    private let realtime: RealTimeAPI = .shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set realtime API delegate for get your setted object.
        realtime.delegate = self
    }
}

extension UIViewController: RealTimeAPIDelegate {
    public func didReceiveSnapShot(_ snapshot: Board) {
        print(snapshot)
    }
    
    public func didReceiveBoardDiff(_ board: Board) {
        print(board)
    }
    
    public func didReceiveTicker(_ ticker: Ticker) {
        print(ticker)
    }
    
    public func didReceiveExecution(_ executions: [Execution]) {
        print(executions)
    }
}
```

## Requirements
XCode 9+

Swift 4+


## Installation

```
$ pod repo update
```

And add this to your Podfile:

```ruby
pod 'SwiftFlyer'
```

and

`$ pod install`

### Carthage
Add this to your Cartfile:

`github "rinov/SwiftFlyer"`

and

`$ carthage update`

## TODO
- [ ] Add timeout to each requests and common settings.
- [ ] Provide HMAC 256 algorithm instead of CryptoSwift.
- [ ] Detect exceeding of API call.

## Disclaimer
USE THE SOFTWARE AT YOUR OWN RISK.

THE AUTHORS NO RESPONSIBILITY FOR YOUR TRADING RESULTS.

## Author

Ryo Ishikawa, rinov@rinov.jp

## License

SwiftFlyer is available under the MIT license. See the LICENSE file for more info.
