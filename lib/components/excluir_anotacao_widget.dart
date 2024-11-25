import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'excluir_anotacao_model.dart';
export 'excluir_anotacao_model.dart';

class ExcluirAnotacaoWidget extends StatefulWidget {
  const ExcluirAnotacaoWidget({
    super.key,
    required this.excluirANOTACAO,
  });

  final DocumentReference? excluirANOTACAO;

  @override
  State<ExcluirAnotacaoWidget> createState() => _ExcluirAnotacaoWidgetState();
}

class _ExcluirAnotacaoWidgetState extends State<ExcluirAnotacaoWidget> {
  late ExcluirAnotacaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExcluirAnotacaoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnotacoesRecord>(
      stream: AnotacoesRecord.getDocument(widget!.excluirANOTACAO!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xF09C9C9C),
                ),
              ),
            ),
          );
        }

        final bottomSheetEditAnotacoesRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 270.0,
          decoration: BoxDecoration(
            color: Color(0xFF0B0D0F),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(
                  0.0,
                  -3.0,
                ),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget!.excluirANOTACAO!.delete();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Anotação apagada com sucesso!',
                            style: TextStyle(
                              color: Color(0xFFFFFFF7),
                            ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor: Color(0xFF048331),
                        ),
                      );
                    },
                    text: 'Excluir',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFC7243E),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pop();
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF12161A),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
