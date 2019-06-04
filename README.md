# Fluttter Shake Animation

<p align="center">
<img alt="demo" width="auto" height="auto" src="./screenshot.png"/>
</p>

## Usage

Create an instance of ShakeController; takes _TickerProvider_ and _Duration_(`Optional`, `default=200 millis`) as params.

```dart
  ShakeController _shakeController;

  @override
  void initState() {
    _shakeController = ShakeController(vsync: this);
    super.initState();
  }
```

Wrap your widget inside a ShakeView Widget

```dart
  @override
  Widget build(BuildContext context) {
     return ShakeView(
                    controller: _shakeController,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Theme.of(context).accentColor,
                      child: Center(
                          child: Text('I can shake',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30))),
                  )
          );
  }
```

Trigger a shake animation by calling `_shakeController.shake()`.
