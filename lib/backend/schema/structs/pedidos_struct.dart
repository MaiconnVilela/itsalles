// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosStruct extends FFFirebaseStruct {
  PedidosStruct({
    String? nomeProduto,
    String? img,
    int? quantidade,
    double? precoTotal,
    double? precoRoupa,
    String? nomeRoupa,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomeProduto = nomeProduto,
        _img = img,
        _quantidade = quantidade,
        _precoTotal = precoTotal,
        _precoRoupa = precoRoupa,
        _nomeRoupa = nomeRoupa,
        super(firestoreUtilData);

  // "NomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? val) => _nomeProduto = val;

  bool hasNomeProduto() => _nomeProduto != null;

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "PrecoTotal" field.
  double? _precoTotal;
  double get precoTotal => _precoTotal ?? 0.0;
  set precoTotal(double? val) => _precoTotal = val;

  void incrementPrecoTotal(double amount) => precoTotal = precoTotal + amount;

  bool hasPrecoTotal() => _precoTotal != null;

  // "PrecoRoupa" field.
  double? _precoRoupa;
  double get precoRoupa => _precoRoupa ?? 0.0;
  set precoRoupa(double? val) => _precoRoupa = val;

  void incrementPrecoRoupa(double amount) => precoRoupa = precoRoupa + amount;

  bool hasPrecoRoupa() => _precoRoupa != null;

  // "NomeRoupa" field.
  String? _nomeRoupa;
  String get nomeRoupa => _nomeRoupa ?? '';
  set nomeRoupa(String? val) => _nomeRoupa = val;

  bool hasNomeRoupa() => _nomeRoupa != null;

  static PedidosStruct fromMap(Map<String, dynamic> data) => PedidosStruct(
        nomeProduto: data['NomeProduto'] as String?,
        img: data['Img'] as String?,
        quantidade: castToType<int>(data['quantidade']),
        precoTotal: castToType<double>(data['PrecoTotal']),
        precoRoupa: castToType<double>(data['PrecoRoupa']),
        nomeRoupa: data['NomeRoupa'] as String?,
      );

  static PedidosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PedidosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'NomeProduto': _nomeProduto,
        'Img': _img,
        'quantidade': _quantidade,
        'PrecoTotal': _precoTotal,
        'PrecoRoupa': _precoRoupa,
        'NomeRoupa': _nomeRoupa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NomeProduto': serializeParam(
          _nomeProduto,
          ParamType.String,
        ),
        'Img': serializeParam(
          _img,
          ParamType.String,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'PrecoTotal': serializeParam(
          _precoTotal,
          ParamType.double,
        ),
        'PrecoRoupa': serializeParam(
          _precoRoupa,
          ParamType.double,
        ),
        'NomeRoupa': serializeParam(
          _nomeRoupa,
          ParamType.String,
        ),
      }.withoutNulls;

  static PedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosStruct(
        nomeProduto: deserializeParam(
          data['NomeProduto'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['Img'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        precoTotal: deserializeParam(
          data['PrecoTotal'],
          ParamType.double,
          false,
        ),
        precoRoupa: deserializeParam(
          data['PrecoRoupa'],
          ParamType.double,
          false,
        ),
        nomeRoupa: deserializeParam(
          data['NomeRoupa'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosStruct &&
        nomeProduto == other.nomeProduto &&
        img == other.img &&
        quantidade == other.quantidade &&
        precoTotal == other.precoTotal &&
        precoRoupa == other.precoRoupa &&
        nomeRoupa == other.nomeRoupa;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nomeProduto, img, quantidade, precoTotal, precoRoupa, nomeRoupa]);
}

PedidosStruct createPedidosStruct({
  String? nomeProduto,
  String? img,
  int? quantidade,
  double? precoTotal,
  double? precoRoupa,
  String? nomeRoupa,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosStruct(
      nomeProduto: nomeProduto,
      img: img,
      quantidade: quantidade,
      precoTotal: precoTotal,
      precoRoupa: precoRoupa,
      nomeRoupa: nomeRoupa,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidosStruct? updatePedidosStruct(
  PedidosStruct? pedidos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedidos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidosStructData(
  Map<String, dynamic> firestoreData,
  PedidosStruct? pedidos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedidos == null) {
    return;
  }
  if (pedidos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedidos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidosData = getPedidosFirestoreData(pedidos, forFieldValue);
  final nestedData = pedidosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedidos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidosFirestoreData(
  PedidosStruct? pedidos, [
  bool forFieldValue = false,
]) {
  if (pedidos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedidos.toMap());

  // Add any Firestore field values
  pedidos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidosListFirestoreData(
  List<PedidosStruct>? pedidoss,
) =>
    pedidoss?.map((e) => getPedidosFirestoreData(e, true)).toList() ?? [];
