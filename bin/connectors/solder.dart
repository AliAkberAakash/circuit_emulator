import '../components/component.dart';
import '../components/power_component.dart';

class Solder{
  static connect(Component c1, Component c2){
    if(c1 is PowerComponent) {
      c1.pin1.connectionStream.listen((event) {
        print("emitted value is $event");
        c2.pin2.emitConnection(event);
      });
    }
    else if(c2 is PowerComponent){
      c2.pin2.connectionStream.listen((event) {
        c1.pin1.emitConnection(event);
      });
    }
  }
}