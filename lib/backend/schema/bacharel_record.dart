import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BacharelRecord extends FirestoreRecord {
  BacharelRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  // "Aula" field.
  String? _aula;
  String get aula => _aula ?? '';
  bool hasAula() => _aula != null;

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "Apostila" field.
  String? _apostila;
  String get apostila => _apostila ?? '';
  bool hasApostila() => _apostila != null;

  // "verificar" field.
  bool? _verificar;
  bool get verificar => _verificar ?? false;
  bool hasVerificar() => _verificar != null;

  // "EDITOR_APP" field.
  bool? _editorApp;
  bool get editorApp => _editorApp ?? false;
  bool hasEditorApp() => _editorApp != null;

  // "Audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "comentarios" field.
  String? _comentarios;
  String get comentarios => _comentarios ?? '';
  bool hasComentarios() => _comentarios != null;

  void _initializeFields() {
    _capa = snapshotData['Capa'] as String?;
    _aula = snapshotData['Aula'] as String?;
    _titulo = snapshotData['Titulo'] as String?;
    _data = snapshotData['Data'] as DateTime?;
    _apostila = snapshotData['Apostila'] as String?;
    _verificar = snapshotData['verificar'] as bool?;
    _editorApp = snapshotData['EDITOR_APP'] as bool?;
    _audio = snapshotData['Audio'] as String?;
    _video = snapshotData['video'] as String?;
    _comentarios = snapshotData['comentarios'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Bacharel');

  static Stream<BacharelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BacharelRecord.fromSnapshot(s));

  static Future<BacharelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BacharelRecord.fromSnapshot(s));

  static BacharelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BacharelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BacharelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BacharelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BacharelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BacharelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBacharelRecordData({
  String? capa,
  String? aula,
  String? titulo,
  DateTime? data,
  String? apostila,
  bool? verificar,
  bool? editorApp,
  String? audio,
  String? video,
  String? comentarios,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Capa': capa,
      'Aula': aula,
      'Titulo': titulo,
      'Data': data,
      'Apostila': apostila,
      'verificar': verificar,
      'EDITOR_APP': editorApp,
      'Audio': audio,
      'video': video,
      'comentarios': comentarios,
    }.withoutNulls,
  );

  return firestoreData;
}

class BacharelRecordDocumentEquality implements Equality<BacharelRecord> {
  const BacharelRecordDocumentEquality();

  @override
  bool equals(BacharelRecord? e1, BacharelRecord? e2) {
    return e1?.capa == e2?.capa &&
        e1?.aula == e2?.aula &&
        e1?.titulo == e2?.titulo &&
        e1?.data == e2?.data &&
        e1?.apostila == e2?.apostila &&
        e1?.verificar == e2?.verificar &&
        e1?.editorApp == e2?.editorApp &&
        e1?.audio == e2?.audio &&
        e1?.video == e2?.video &&
        e1?.comentarios == e2?.comentarios;
  }

  @override
  int hash(BacharelRecord? e) => const ListEquality().hash([
        e?.capa,
        e?.aula,
        e?.titulo,
        e?.data,
        e?.apostila,
        e?.verificar,
        e?.editorApp,
        e?.audio,
        e?.video,
        e?.comentarios
      ]);

  @override
  bool isValidKey(Object? o) => o is BacharelRecord;
}
