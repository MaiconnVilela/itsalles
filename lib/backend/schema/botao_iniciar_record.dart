import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotaoIniciarRecord extends FirestoreRecord {
  BotaoIniciarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Visitante" field.
  bool? _visitante;
  bool get visitante => _visitante ?? false;
  bool hasVisitante() => _visitante != null;

  // "Login" field.
  bool? _login;
  bool get login => _login ?? false;
  bool hasLogin() => _login != null;

  void _initializeFields() {
    _visitante = snapshotData['Visitante'] as bool?;
    _login = snapshotData['Login'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Botao_Iniciar');

  static Stream<BotaoIniciarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BotaoIniciarRecord.fromSnapshot(s));

  static Future<BotaoIniciarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BotaoIniciarRecord.fromSnapshot(s));

  static BotaoIniciarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BotaoIniciarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BotaoIniciarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BotaoIniciarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BotaoIniciarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BotaoIniciarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBotaoIniciarRecordData({
  bool? visitante,
  bool? login,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Visitante': visitante,
      'Login': login,
    }.withoutNulls,
  );

  return firestoreData;
}

class BotaoIniciarRecordDocumentEquality
    implements Equality<BotaoIniciarRecord> {
  const BotaoIniciarRecordDocumentEquality();

  @override
  bool equals(BotaoIniciarRecord? e1, BotaoIniciarRecord? e2) {
    return e1?.visitante == e2?.visitante && e1?.login == e2?.login;
  }

  @override
  int hash(BotaoIniciarRecord? e) =>
      const ListEquality().hash([e?.visitante, e?.login]);

  @override
  bool isValidKey(Object? o) => o is BotaoIniciarRecord;
}
