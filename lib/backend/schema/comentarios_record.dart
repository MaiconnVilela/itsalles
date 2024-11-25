import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentariosRecord extends FirestoreRecord {
  ComentariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "aula" field.
  String? _aula;
  String get aula => _aula ?? '';
  bool hasAula() => _aula != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _comentario = snapshotData['comentario'] as String?;
    _aula = snapshotData['aula'] as String?;
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comentarios');

  static Stream<ComentariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentariosRecord.fromSnapshot(s));

  static Future<ComentariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComentariosRecord.fromSnapshot(s));

  static ComentariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentariosRecordData({
  String? comentario,
  String? aula,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comentario': comentario,
      'aula': aula,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentariosRecordDocumentEquality implements Equality<ComentariosRecord> {
  const ComentariosRecordDocumentEquality();

  @override
  bool equals(ComentariosRecord? e1, ComentariosRecord? e2) {
    return e1?.comentario == e2?.comentario &&
        e1?.aula == e2?.aula &&
        e1?.data == e2?.data;
  }

  @override
  int hash(ComentariosRecord? e) =>
      const ListEquality().hash([e?.comentario, e?.aula, e?.data]);

  @override
  bool isValidKey(Object? o) => o is ComentariosRecord;
}
