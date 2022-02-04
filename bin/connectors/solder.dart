import '../components/component.dart';
import '../components/power_component.dart';

class Solder{
  void connect(Component c1, Component c2){
    if(c1 is PowerComponent) {
      _connectPowerSourceWithComponent(c1, c2);
    }
    else if(c2 is PowerComponent){
      _connectComponentWithPowerSource(c1, c2);
    }else{
      _connectComponentWithComponent(c1, c2);
    }
  }

  void _connectPowerSourceWithComponent(PowerComponent p, Component c){
    p.pin1.connectionStream.listen((event) {
      print("emitted value is $event");
      c.pin2.emitConnection(event);
    });
  }

  void _connectComponentWithPowerSource(Component c, PowerComponent p){
    p.pin2.connectionStream.listen((event) {
      print("emitted value is $event");
      c.pin1.emitConnection(event);
    });
  }

  void _connectComponentWithComponent(Component c1, Component c2){
    c1.pin2.connectionStream.listen((event) {
      c2.pin2.emitConnection(event);
    });
    c2.pin1.connectionStream.listen((event) {
      c1.pin1.emitConnection(event);
    });
  }

}