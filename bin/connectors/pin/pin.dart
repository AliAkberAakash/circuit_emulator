import 'package:rxdart/rxdart.dart';

abstract class Pin{
  final BehaviorSubject<int?> _connectionController = BehaviorSubject<int>();
  Stream<int?> get connectionStream => _connectionController.stream;
  int? get connectionValue  => _connectionController.valueOrNull;
  void emitConnection(){
    _connectionController.add(1);
  }
}