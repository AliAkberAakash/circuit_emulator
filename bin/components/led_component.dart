import '../connectors/pin/negative_pin.dart';
import '../connectors/pin/pin.dart';
import '../connectors/pin/positive_pin.dart';
import 'component.dart';

class LEDComponent extends Component{
  @override
  Pin pin1 = PositivePin();

  @override
  Pin pin2 = NegativePin();

  bool status = false;

  LEDComponent(){
    _initListeners();
  }

  void _initListeners(){
    pin1.connectionStream.listen((event) {
      _checkStatus();
    });
    pin2.connectionStream.listen((event) {
      _checkStatus();
    });
  }

  _checkStatus(){
    if(pin1.connectionValue?.uniqueId!=null && pin2.connectionValue?.uniqueId!=null) {
      status = pin1.connectionValue?.uniqueId == pin2.connectionValue?.uniqueId;
    }
    print("status of led : $status");
  }

}