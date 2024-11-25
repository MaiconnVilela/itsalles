import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedeSocialRecord extends FirestoreRecord {
  RedeSocialRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _img = snapshotData['Img'] as String?;
    _nome = snapshotData['Nome'] as String?;
    _link = snapshotData['Link'] as String?;
    _data = snapshotData['Data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RedeSocial');

  static Stream<RedeSocialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedeSocialRecord.fromSnapshot(s));

  static Future<RedeSocialRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RedeSocialRecord.fromSnapshot(s));

  static RedeSocialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedeSocialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedeSocialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedeSocialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedeSocialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedeSocialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedeSocialRecordData({
  String? img,
  String? nome,
  String? link,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Img': img,
      'Nome': nome,
      'Link': link,
      'Data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedeSocialRecordDocumentEquality implements Equality<RedeSocialRecord> {
  const RedeSocialRecordDocumentEquality();

  @override
  bool equals(RedeSocialRecord? e1, RedeSocialRecord? e2) {
    return e1?.img == e2?.img &&
        e1?.nome == e2?.nome &&
        e1?.link == e2?.link &&
        e1?.data == e2?.data;
  }

  @override
  int hash(RedeSocialRecord? e) =>
      const ListEquality().hash([e?.img, e?.nome, e?.link, e?.data]);

  @override
  bool isValidKey(Object? o) => o is RedeSocialRecord;
}
