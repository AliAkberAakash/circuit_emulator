import 'package:uuid/uuid.dart';

import '../connectors/pin/negative_pin.dart';
import '../connectors/pin/pin.dart';
import '../connectors/pin/positive_pin.dart';
import '../energy/energy.dart';
import '../energy/negative_energy.dart';
import '../energy/positive_energy.dart';
import 'component.dart';

class PowerComponent extends Component{
  @override
  Pin pin1 = PositivePin();

  @override
  Pin pin2 = NegativePin();

  void start(){
    String uuid = Uuid().v4();
    Energy posEnergy = PositiveEnergy(uuid);
    Energy negEnergy = NegativeEnergy(uuid);
    pin1.emitConnection(posEnergy);
    pin2.emitConnection(negEnergy);
  }

}