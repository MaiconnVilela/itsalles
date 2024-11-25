import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnotacoesRecord extends FirestoreRecord {
  AnotacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "anotacao" field.
  String? _anotacao;
  String get anotacao => _anotacao ?? '';
  bool hasAnotacao() => _anotacao != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "aula" field.
  String? _aula;
  String get aula => _aula ?? '';
  bool hasAula() => _aula != null;

  void _initializeFields() {
    _anotacao = snapshotData['anotacao'] as String?;
    _id = snapshotData['id'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _titulo = snapshotData['titulo'] as String?;
    _aula = snapshotData['aula'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Anotacoes');

  static Stream<AnotacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnotacoesRecord.fromSnapshot(s));

  static Future<AnotacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnotacoesRecord.fromSnapshot(s));

  static AnotacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnotacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnotacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnotacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnotacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnotacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnotacoesRecordData({
  String? anotacao,
  String? id,
  DateTime? data,
  String? titulo,
  String? aula,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'anotacao': anotacao,
      'id': id,
      'data': data,
      'titulo': titulo,
      'aula': aula,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnotacoesRecordDocumentEquality implements Equality<AnotacoesRecord> {
  const AnotacoesRecordDocumentEquality();

  @override
  bool equals(AnotacoesRecord? e1, AnotacoesRecord? e2) {
    return e1?.anotacao == e2?.anotacao &&
        e1?.id == e2?.id &&
        e1?.data == e2?.data &&
        e1?.titulo == e2?.titulo &&
        e1?.aula == e2?.aula;
  }

  @override
  int hash(AnotacoesRecord? e) => const ListEquality()
      .hash([e?.anotacao, e?.id, e?.data, e?.titulo, e?.aula]);

  @override
  bool isValidKey(Object? o) => o is AnotacoesRecord;
}
