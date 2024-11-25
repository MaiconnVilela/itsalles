import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaleConoscoRecord extends FirestoreRecord {
  FaleConoscoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Detalhes" field.
  String? _detalhes;
  String get detalhes => _detalhes ?? '';
  bool hasDetalhes() => _detalhes != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _nome = snapshotData['Nome'] as String?;
    _detalhes = snapshotData['Detalhes'] as String?;
    _data = snapshotData['Data'] as DateTime?;
    _img = snapshotData['Img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FaleConosco');

  static Stream<FaleConoscoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FaleConoscoRecord.fromSnapshot(s));

  static Future<FaleConoscoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FaleConoscoRecord.fromSnapshot(s));

  static FaleConoscoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FaleConoscoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FaleConoscoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FaleConoscoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FaleConoscoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FaleConoscoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFaleConoscoRecordData({
  String? nome,
  String? detalhes,
  DateTime? data,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome': nome,
      'Detalhes': detalhes,
      'Data': data,
      'Img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class FaleConoscoRecordDocumentEquality implements Equality<FaleConoscoRecord> {
  const FaleConoscoRecordDocumentEquality();

  @override
  bool equals(FaleConoscoRecord? e1, FaleConoscoRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.detalhes == e2?.detalhes &&
        e1?.data == e2?.data &&
        e1?.img == e2?.img;
  }

  @override
  int hash(FaleConoscoRecord? e) =>
      const ListEquality().hash([e?.nome, e?.detalhes, e?.data, e?.img]);

  @override
  bool isValidKey(Object? o) => o is FaleConoscoRecord;
}
