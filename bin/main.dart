import 'components/led_component.dart';
import 'components/power_component.dart';

void main(){
  final LEDComponent ledComponent = LEDComponent();
  final PowerComponent powerComponent = PowerComponent();

  ledComponent.connect(powerComponent);

  powerComponent.start();

}