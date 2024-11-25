import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import '/flutter_flow/flutter_flow_util.dart';

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://fhnngjmqpbwnvxnbyrus.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZobm5nam1xcGJ3bnZ4bmJ5cnVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM0NzMzNzYsImV4cCI6MjAzOTA0OTM3Nn0.1XSmFX2MMvEi_PoHFk_Y_QmdqfRqJdz4irEkR99zYLE';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
