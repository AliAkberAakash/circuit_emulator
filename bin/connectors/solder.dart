import '../components/component.dart';
import '../components/power_component.dart';

class Solder{
  static connect(Component c1, Component c2){
    if(c1 is PowerComponent) {
      connectPowerSourceWithComponent(c1, c2);
    }
    else if(c2 is PowerComponent){
      connectComponentWithPowerSource(c1, c2);
    }
  }

  static connectPowerSourceWithComponent(PowerComponent p, Component c){
    p.pin1.connectionStream.listen((event) {
      print("emitted value is $event");
      c.pin2.emitConnection(event);
    });
  }

  static connectComponentWithPowerSource(Component c, PowerComponent p){
    p.pin2.connectionStream.listen((event) {
      print("emitted value is $event");
      c.pin1.emitConnection(event);
    });
  }

}