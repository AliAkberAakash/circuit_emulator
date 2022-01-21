import '../connectors/pin/negative_pin.dart';
import '../connectors/pin/pin.dart';
import '../connectors/pin/positive_pin.dart';
import 'component.dart';

class PowerComponent extends Component{
  @override
  Pin pin1 = PositivePin();

  @override
  Pin pin2 = NegativePin();

  void start(){
    pin1.emitConnection();
    pin2.emitConnection();
  }

}