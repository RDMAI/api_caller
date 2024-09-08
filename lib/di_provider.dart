import 'package:get_it/get_it.dart';

import 'blocs/connection_builder_view_bloc/connection_builder_view_bloc.dart';
import 'blocs/stream_logger/stream_logger_bloc.dart';
import 'repos/connection_stream_service.dart';

GetIt getIt = GetIt.instance;

void initDI() {
  getIt.registerSingleton<ConnectionStreamService>(ConnectionStreamService());
  getIt.registerSingleton<StreamLoggerBloc>(StreamLoggerBloc(streamService: getIt<ConnectionStreamService>()));
  getIt.registerSingleton<ConnectionBuilderViewBloc>(ConnectionBuilderViewBloc(streamService: getIt<ConnectionStreamService>()));
}