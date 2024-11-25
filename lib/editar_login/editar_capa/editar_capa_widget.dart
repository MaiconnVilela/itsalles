import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editar_capa_model.dart';
export 'editar_capa_model.dart';

class EditarCapaWidget extends StatefulWidget {
  const EditarCapaWidget({super.key});

  @override
  State<EditarCapaWidget> createState() => _EditarCapaWidgetState();
}

class _EditarCapaWidgetState extends State<EditarCapaWidget> {
  late EditarCapaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarCapaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF0B0D0F),
      appBar: AppBar(
        backgroundColor: Color(0xFF111417),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 3.0,
      ),
      body: SafeArea(
        top: true,
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (_model.uploadedFileUrl != null &&
                              _model.uploadedFileUrl != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 1.0, 6.0, 1.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  _model.uploadedFileUrl,
                                  width: double.infinity,
                                  height: 199.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (_model.uploadedFileUrl == null ||
                              _model.uploadedFileUrl == '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Carregando...',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 7000),
                                      backgroundColor: Color(0xFF111417),
                                    ),
                                  );
                                  final selectedMedia = await selectMedia(
                                    mediaSource: MediaSource.photoGallery,
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 202.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF111417),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cloud_upload_rounded,
                                        color: Color(0xFF565C62),
                                        size: 80.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.uploadedFileUrl == null ||
                                    _model.uploadedFileUrl.isEmpty) {
                                  return;
                                }

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  capa: _model.uploadedFileUrl,
                                ));
                                await Future.delayed(
                                    const Duration(milliseconds: 1500));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Capa alterada',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFF7),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor: Color(0xFF048331),
                                  ),
                                );

                                context.pushNamed(
                                  'Perfil',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: 'Salvar',
                              options: FFButtonOptions(
                                width: 237.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF111417),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF8B97A2),
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 6.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
