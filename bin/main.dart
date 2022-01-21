import 'components/led_component.dart';
import 'components/power_component.dart';

void main(){
  final LEDComponent ledComponent = LEDComponent();
  final PowerComponent powerComponent = PowerComponent();

  print("status of led : ${ledComponent.status}");

  ledComponent.connect(powerComponent);
  print("status of led : ${ledComponent.status}");

  powerComponent.start();
  Future.delayed(Duration(seconds: 1)).then((value){
    print("status of led : ${ledComponent.status}");
  });


}