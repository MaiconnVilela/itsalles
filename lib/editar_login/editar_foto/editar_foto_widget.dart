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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editar_foto_model.dart';
export 'editar_foto_model.dart';

class EditarFotoWidget extends StatefulWidget {
  const EditarFotoWidget({super.key});

  @override
  State<EditarFotoWidget> createState() => _EditarFotoWidgetState();
}

class _EditarFotoWidgetState extends State<EditarFotoWidget> {
  late EditarFotoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarFotoModel());
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (_model.uploadedFileUrl != null &&
                        _model.uploadedFileUrl != '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 120.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            _model.uploadedFileUrl,
                            width: 97.0,
                            height: 97.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (_model.uploadedFileUrl == null ||
                        _model.uploadedFileUrl == '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 120.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia = await selectMedia(
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
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
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF111417),
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(
                                  color: Color(0xFF95A1AC),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.image,
                                    color: Color(0xFF95A1AC),
                                    size: 40.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 7.0, 0.0, 0.0),
                                    child: Text(
                                      'Alterar Foto',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                      child: FFButtonWidget(
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
                            photoUrl: _model.uploadedFileUrl,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Foto alterada',
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
                              ),
                            },
                          );
                        },
                        text: 'Salvar',
                        options: FFButtonOptions(
                          width: 120.0,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF111417),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 10.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
