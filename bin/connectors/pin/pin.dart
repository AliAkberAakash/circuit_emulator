import 'package:rxdart/rxdart.dart';
import '../../energy/energy.dart';

abstract class Pin{
  final BehaviorSubject<Energy?> _connectionController = BehaviorSubject.seeded(null);
  Stream<Energy?> get connectionStream => _connectionController.stream;
  Energy? get connectionValue  => _connectionController.valueOrNull;

  void emitConnection(Energy? energy){
    _connectionController.add(energy);
  }
}