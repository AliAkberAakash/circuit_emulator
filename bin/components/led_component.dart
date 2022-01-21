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

  connect(Component component){
    component.pin1.connectionStream.listen((event) {
      pin1.emitConnection();
      _checkStatus();
    });
    component.pin2.connectionStream.listen((event) {
      pin2.emitConnection();
      _checkStatus();
    });
  }

  _checkStatus(){
    status = pin1.connectionValue==pin2.connectionValue;
  }

}