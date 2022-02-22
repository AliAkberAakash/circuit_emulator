import '../connectors/pin/negative_pin.dart';
import '../connectors/pin/pin.dart';
import '../connectors/pin/positive_pin.dart';
import '../energy/energy.dart';
import 'component.dart';

class SwitchComponent extends Component{

  SwitchComponent(){
    pin1.connectionStream.listen((event) {
      energy = event;
    });
    pin2.connectionStream.listen((event) {
      energy = event;
    });
  }

  @override
  Pin pin1 = PositivePin();

  @override
  Pin pin2 = NegativePin();

  bool _status = false;
  get isOn => _status;

  Energy? energy;

  void turnOn(){
    _status = true;
    pin1.emitConnection(energy);
    pin2.emitConnection(energy);
  }

  void turnOff(){
    _status = false;
    pin1.emitConnection(null);
    pin2.emitConnection(null);
  }

  void toggleSwitch(){
    _status = !_status;
  }

}