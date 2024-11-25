import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _getVersionsShortNameVar =
          prefs.getString('ff_getVersionsShortNameVar') ??
              _getVersionsShortNameVar;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _getVersionsShortNameVar = 'AA';
  String get getVersionsShortNameVar => _getVersionsShortNameVar;
  set getVersionsShortNameVar(String value) {
    _getVersionsShortNameVar = value;
    prefs.setString('ff_getVersionsShortNameVar', value);
  }

  String _StatusPag = 'Nenhum';
  String get StatusPag => _StatusPag;
  set StatusPag(String value) {
    _StatusPag = value;
  }

  int _contadorPagamento = -1;
  int get contadorPagamento => _contadorPagamento;
  set contadorPagamento(int value) {
    _contadorPagamento = value;
  }

  double _TotalPreco = 0.0;
  double get TotalPreco => _TotalPreco;
  set TotalPreco(double value) {
    _TotalPreco = value;
  }

  int _CondicaoGeral = 1;
  int get CondicaoGeral => _CondicaoGeral;
  set CondicaoGeral(int value) {
    _CondicaoGeral = value;
  }

  List<PedidosStruct> _PedidosCar = [];
  List<PedidosStruct> get PedidosCar => _PedidosCar;
  set PedidosCar(List<PedidosStruct> value) {
    _PedidosCar = value;
  }

  void addToPedidosCar(PedidosStruct value) {
    PedidosCar.add(value);
  }

  void removeFromPedidosCar(PedidosStruct value) {
    PedidosCar.remove(value);
  }

  void removeAtIndexFromPedidosCar(int index) {
    PedidosCar.removeAt(index);
  }

  void updatePedidosCarAtIndex(
    int index,
    PedidosStruct Function(PedidosStruct) updateFn,
  ) {
    PedidosCar[index] = updateFn(_PedidosCar[index]);
  }

  void insertAtIndexInPedidosCar(int index, PedidosStruct value) {
    PedidosCar.insert(index, value);
  }

  int _NumeroCarrinho = 0;
  int get NumeroCarrinho => _NumeroCarrinho;
  set NumeroCarrinho(int value) {
    _NumeroCarrinho = value;
  }

  int _quantidade = 1;
  int get quantidade => _quantidade;
  set quantidade(int value) {
    _quantidade = value;
  }

  int _status = 0;
  int get status => _status;
  set status(int value) {
    _status = value;
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
  }

  int _NumeroPedido = 0;
  int get NumeroPedido => _NumeroPedido;
  set NumeroPedido(int value) {
    _NumeroPedido = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
