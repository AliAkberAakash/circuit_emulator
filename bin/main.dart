import 'dart:async';

import 'components/component.dart';
import 'components/led_component.dart';
import 'components/power_component.dart';
import 'connectors/solder.dart';

StreamSubscription connect(Component c1, Component c2){
  return c1.pin1.connectionStream.listen((event) {
    print("emitted value is $event");
    c2.pin2.emitConnection(event);
  });
}

void main() async{
  final LEDComponent ledComponent = LEDComponent();
  final PowerComponent powerComponent = PowerComponent();

  final Solder solder = Solder();

  solder.connect(powerComponent, ledComponent);
  solder.connect(ledComponent, powerComponent);
}