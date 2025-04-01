import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: Color(0xFF7D5136),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                child: Container(
                  height: 710,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0,
                                    1,
                                  ),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Color(0x4D39D2C0),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xFF39D2C0),
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: currentUserPhoto,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            currentUserDisplayName,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 24,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            currentUserEmail,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                          child: Text(
                            'My Profile',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Home');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3416202A),
                                    offset: Offset(
                                      0.0,
                                      2,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Home',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF14181B),
                                                fontSize: 25,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF57636C),
                                        size: 20,
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
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Favourites');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3416202A),
                                    offset: Offset(
                                      0.0,
                                      2,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.favorite_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Favourites',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF14181B),
                                                fontSize: 25,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF57636C),
                                        size: 20,
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
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Menu');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3416202A),
                                    offset: Offset(
                                      0.0,
                                      2,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.restaurant_menu_rounded,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Menu',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF14181B),
                                                fontSize: 25,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF57636C),
                                        size: 20,
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
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  'SplashScreen', context.mounted);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3416202A),
                                    offset: Offset(
                                      0.0,
                                      2,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.logout_rounded,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Log Out',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF14181B),
                                                fontSize: 23,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF57636C),
                                        size: 20,
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
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 148,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3416202A),
                                  offset: Offset(
                                    0.0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_history_sharp,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Text(
                                              'Change Profile Picture',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 16,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1, -1),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xFF57636C),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model.textController1,
                                            focusNode:
                                                _model.textFieldFocusNode1,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Image URL',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await currentUserReference!
                                          .update(createUserDetailsRecordData(
                                        photoUrl: _model.textController1.text,
                                      ));

                                      context.pushNamed('Profile');
                                    },
                                    text: 'Change Picture',
                                    options: FFButtonOptions(
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: Color(0xFF7D5136),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 148,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3416202A),
                                  offset: Offset(
                                    0.0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.drive_file_rename_outline_sharp,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Text(
                                              'Change Profile Name',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 16,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1, -1),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xFF57636C),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, -1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Display Name',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await currentUserReference!
                                          .update(createUserDetailsRecordData(
                                        displayName:
                                            _model.textController2.text,
                                      ));

                                      context.pushNamed('Profile');
                                    },
                                    text: 'Change Name',
                                    options: FFButtonOptions(
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: Color(0xFF7D5136),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  width: 423,
                  height: 57,
                  decoration: BoxDecoration(
                    color: Color(0xFFECD5BE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.home,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Home');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.favorite_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Favourites');
                            },
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                                'SplashScreen', context.mounted);
                          },
                          child: Icon(
                            Icons.logout_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.restaurant_menu_sharp,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Menu');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Profile');
                            },
                          ),
                        ),
                      ],
                    ),
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
